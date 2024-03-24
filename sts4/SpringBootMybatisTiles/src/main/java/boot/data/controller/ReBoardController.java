package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemBoardDto;
import boot.data.dto.MemberDto;
import boot.data.dto.ReboardDto;
import boot.data.service.MemberService;
import boot.data.service.ReboardService;

@Controller
@RequestMapping("/reboard")
public class ReBoardController {
	
	@Autowired
	ReboardService service;
	
	@Autowired
	MemberService mservice;

	@GetMapping("/list")
	public ModelAndView list(
			@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value="searchcolumn", required = false) String searchcolumn,
			@RequestParam(value="searchword", required = false) String searchword)
		//searchcolumn 댓글 / 게시글+댓글 / 제목만 / 글작성자 / 댓글내용  >> 카테고리 같은거
		//searchword 검색바에 입력하는 단어
	    //startnum  시작번호
		//perpage  한 페이지당 보여질 글의 갯수
	{
		ModelAndView model = new ModelAndView();
		
		int totalCount = service.getTotalCount(searchcolumn,searchword);
		
		//페이징 처리에 필요한 변수 선언
		  
				int totalPage; //총 페이지수
				int startPage; //각블럭에서 보여질 시작페이지
				int endPage; //각블럭에서 보여질 끝페이지
				int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
				int perPage=5; //한페이지당 보여질 글의 갯수
				int perBlock=5; //한블럭당 보여질 페이지 개수
			
				//총페이지수 구하기
				//총글의 갯수/한페이지당 보여질 개수로 나눔(7/5=1)
				//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
				  	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
				 
				//각블럭당 보여야할 시작페이지
				//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
				//현재페이지 13  시작:11  끝:15
				  	startPage=(currentPage-1)/perBlock*perBlock+1;
				     
				  	endPage=startPage+perBlock-1;
				    
				 // 총페이지가 23일경우 마지막블럭은 25가아니라 23이다   
				    if(endPage>totalPage)
				       
				    	endPage=totalPage;
				     
					//각페이지에서 보여질 시작번호
					//1페이지: 0,2페이지:5 3페이지:10....
					startNum=(currentPage-1)*perPage;	
					
					//각 페이지에서 필요한 게시글 가져오기
					List<ReboardDto> list = service.getPagingList(searchcolumn, searchword, startNum, perPage);
				
					//각 페이지에 출력할 시작번호
					int no = totalCount-(currentPage-1)*perPage;
						
						//key값         value값
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("no", no);
		model.addObject("currentPage", currentPage);

		//ystem.out.println("totalCount="+totalCount);
		
		model.setViewName("/reboard/boardlist");
		
		return model;
	}
	
	@GetMapping("/form")
	public String reform(@RequestParam(defaultValue = "0") int num,
						 @RequestParam(defaultValue = "0") int regroup,
						 @RequestParam(defaultValue = "0") int restep,
						 @RequestParam(defaultValue = "0") int relevel,
						 @RequestParam(defaultValue = "1") int currentPage,
						 @ModelAttribute ReboardDto dto,
						 Model model) {
		//답글일 경우에만 넘어오는 값들이다
		
		//새글일 경우는 모두 null이므로 defaultValue만 값으로 전달
		model.addAttribute("num",num);
		model.addAttribute("regroup",regroup);
		model.addAttribute("restep",restep);
		model.addAttribute("relevel",relevel);
		model.addAttribute("currentPage", currentPage);
		
		//새글일 경우는 "", 답글일 경우에는 원글 제목 가져오기 
		String subject="";
		if(num>0)     //num과 groutnum은 절대 겹쳐서는 안 됨.
					  //새 글이 없으면 num값이 없으니까 0
		{			  //num은 처음에 넘어오는 값이 없으니까 0. 거기에 더해줘서 +1이 되면서 순차적으로
			subject=service.getData(num).getSubject();
		}
		model.addAttribute("subject", subject);
		
		service.insertReboard(dto);
		
		return "/reboard/addform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute ReboardDto dto,
						 HttpSession session,
						 @RequestParam ArrayList<MultipartFile> upload,
						 @RequestParam int currentPage){
		String path = session.getServletContext().getRealPath("/rephoto");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo = "";
		
		if(upload.get(0).getOriginalFilename().equals(""))
			photo = "no";
		else {
			
			for(MultipartFile f:upload)	{
			String photoname = sdf.format(new Date())+f.getOriginalFilename();
			photo += photoname+",";
			
			try {
				f.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			photo = photo.substring(0, photo.length()-1);
		}
			
		String myid = (String)session.getAttribute("myid");
		String name = (String)session.getAttribute("loginname");
		
		dto.setPhoto(photo);
		dto.setId(myid);
		dto.setName(name);
				
		service.insertReboard(dto);
		
		return "redirect:list?currentPage="+currentPage;
	}
	
	@GetMapping("/content")
	public String detail(int num, int currentPage,
						 Model model){
		//조회수 증가
		service.updateReadCount(num);
		
		//dto
		ReboardDto dto = service.getData(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", currentPage);
		
		return "/reboard/content";
		
	}
	
	//추천수 증가
	
	@GetMapping("/updateLikes")
	@ResponseBody
	public Map<String, Integer> updateLikes(@RequestParam int num){
		Map<String, Integer> map = new HashMap<>();
		
		int likes = service.getData(num).getLikes();
		
		map.put("likes",likes);
		//model.addAttribute("currentPage", currentPage);
		
		service.updateLikes(num);
		
		return map;
	}
	
	//삭제
	
	
}
