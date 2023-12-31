package spring.mvc.friday;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.UploadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {
	
	@Autowired
	InfoInter inter;
	
/*	@GetMapping("info/list")
	public ModelAndView list(@RequestParam String title,
			@RequestParam String search)
	{
		ModelAndView model = new ModelAndView();
		

		int totalCount = inter.getTotalCount();
		//List<InfoDto> list=inter.getAllInfos();
		
		model.addObject("totalCount", totalCount);
		//model.addAttribute("list", list);
		
		model.setViewName("info/infolist");
		return model;
		
	} */
	
	@GetMapping("info/list")
	public String infolist(Model model,@RequestParam(defaultValue = "name") String title,
			@RequestParam(required = false) String search)  //1.ModelAndView 또는 Model model
	{
		
		int totalCount = inter.getTotalCount();
		//List<InfoDto> list=inter.getAllInfos();
		
		model.addAttribute("totalCount", totalCount);
		
		System.out.println(title+","+search);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("search", search);
		map.put("title", title);
		
		List<InfoDto> list = inter.getAllInfos(map);
		
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list",list);
		//model.addAttribute("list", list);
		
		return "info/infolist";
		
	} 
	
	@GetMapping("info/addform")
	public String addform()
	{
		return "info/addform";
	}
	
	@PostMapping("info/insert")
	public String insert(@ModelAttribute InfoDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo="";
		
		//사진 선택을 안 했을 경우 no
		if(upload.getOriginalFilename().equals(""))
			photo="no";
		else
		{
			String fName=upload.getOriginalFilename();
			fName=sdf.format(new Date())+"_"+fName;
			photo=fName;
			
			//업로드			//transferTo로 file을 생성해서 이미지가 실제로 올라감
			try {  //파일 업로드 무조건 try catch
				upload.transferTo(new File(path+"/"+photo));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//dto의 photo에 넣기
		dto.setPhoto(photo);
		
		//insert
		inter.insertMyInfo(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("info/delete")
	public String deleteMyInfo(
					@RequestParam String num, HttpSession session)
	{
		String photo=inter.getData(num).getPhoto();
		
		if(!photo.equals("no"))
		{
			String path=session.getServletContext().getRealPath("/resources/image/");
			
			File file=new File(path+"\\"+photo);
			file.delete();
		}
		
		//db삭제
		inter.deleteMyInfo(num);
		return "redirect:list";
	}
	
	@GetMapping("info/uform")
	public String uform(@RequestParam String num, Model model)
	{
		InfoDto dto = inter.getData(num);
		
		model.addAttribute("dto",dto);
		return "info/updateform";
	}
	
	@PostMapping("info/update")
	public String update(@ModelAttribute InfoDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{	
		String path=session.getServletContext().getRealPath("/resources/image/");
		System.out.println(path);

		
		String photoname; //dto에 담을 변수
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		//사진 선택 안할 경우 null
		if(upload.getOriginalFilename().equals(""))
			photoname=null;
		else {
			photoname=upload.getOriginalFilename();
			photoname=sdf.format(new Date())+"_"+photoname;
			
			//업로드
			try {
				upload.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//dto의 photo에 업로드한 photoname 넣어주기
		dto.setPhoto(photoname);
		
		//update
		inter.updateMyInfo(dto);
		
		return "redirect:list";
	}
	
	
}

