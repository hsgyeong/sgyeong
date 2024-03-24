package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/member/myinfo")
	public String info(@ModelAttribute MemberDto dto,Model model){
		List<MemberDto> list = service.getAllMembers();
		model.addAttribute("list",list);
					
		return "/member/myinfo";
	}

	@GetMapping("/member/list")
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		
		List<MemberDto> list = service.getAllMembers();
		
		//list.size()로 totalCount 구할 수 있음
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		model.setViewName("/member/memberlist");
		
		return model;
	}
	
	@GetMapping("/member/passfail")
	public String passfail(){
		return "/member/passfail";
	}
	
	@GetMapping("/member/form")
	public String form(){
		return "/member/addform";
	}
	
	//아이디체크
	@GetMapping("/member/idcheck")
	@ResponseBody  //responsebody 해야 json으로 반환. ajax로 할 때 무조건 responsebody 줘야함
	public Map<String, Integer> idCheck(@RequestParam String id){
		Map<String, Integer> map = new HashMap<>();
		int n=service.getSerchId(id);
		
			//string key / integer value
		map.put("count", n);  //0 or 1을 count로 받음
		return map;
	}
	
	
	//insert membersave로 들어가도록 (일단 list로 가는데 admin이 아니면 gaipsuccess로 이동 예정)
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto,
						 @RequestParam MultipartFile myphoto,
						 HttpSession session){
		String path = session.getServletContext().getRealPath("/membersave");
		SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+myphoto.getOriginalFilename();
		
		//dto저장
		dto.setPhoto(fileName);
			
		try {
			myphoto.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		service.insertMember(dto);
		
		return "redirect:list";
	}
	
/*	@GetMapping("/member/out")  --강퇴
	public String out(@RequestParam String num,
					  HttpServletRequest request){
		String photo = serv
		service.deleteMember(num);
		
		return "redirect:list";
	} */
	
	//삭제는 ajax
	@GetMapping("/member/delete")
	@ResponseBody
	public void deleteMember(@RequestParam String num){
		service.deleteMember(num);
	}
	
	//사진만 수정
	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void photoupload(String num,
				MultipartFile photo,
				HttpSession session){
		//업로드할 경로
		String path = session.getServletContext().getRealPath("/membersave");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(new Date())+photo.getOriginalFilename();
		
		//업로드
		try {
			photo.transferTo(new File(path+"\\"+fileName));
			
			
			service.updatePhoto(num, fileName);//db사진 수정
			//세션사진수정
			session.setAttribute("loginphoto", fileName);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	//string은 포워드를 하기 위한 것. ajax는 포워드가 없음
	//dto 자체를 그대로 res로 넘겨서 화면에 띄워줄 수 있음
	@GetMapping("/member/updatemodal")
	@ResponseBody
	public MemberDto updateModal(@RequestParam String num){
		return service.getDataByNum(num);
	}
	
	@GetMapping("/member/updateinfo")
	@ResponseBody
	public String updateinfo(@ModelAttribute MemberDto dto){
		service.updateMember(dto);
		
		return "redirect:myinfo";
	}
	
	
	
	
	//나의 정보에서 삭제
	@GetMapping("/member/deleteme")
	@ResponseBody  //ajax로 처리하려면 responsebody 써야함
	public void deleteinfo(@RequestParam String num,
						   HttpSession session)	{	
		String path = session.getServletContext().getRealPath("/membersave");
		String photo = service.getDataByNum(num).getPhoto();
		File file = new File(path+"\\"+photo);
		file.delete();
	
		service.deleteMember(num);
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		session.removeAttribute("loginphoto");
		session.removeAttribute("saveok");
		
	}
}
