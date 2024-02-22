package hmart.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import hmart.data.dao.HMartAdminDao;
import hmart.data.dao.HMartMemberDao;
import hmart.data.dto.HMartMemberDto;
import hmart.data.dto.itemDto;
import hmart.data.service.HMartMemberService;

@Controller
public class AdminController {

		@Autowired 
		HMartMemberService hmartMemberService;
		
		@Autowired
		HMartMemberDao hmartMemberDao;
		
		@Autowired
		HMartAdminDao hmartAdminDao;
	
		@GetMapping("/admin-login") 
		public String adminLogin()
		{
			return "/admin/adminLogin";
		}
		
		 @PostMapping("/admin-loginproc") 
		  public String loginproc(@RequestParam String id,
		  @RequestParam String password,
		  @RequestParam(required=false) 
		  String cbsave, HttpSession session) 
		  { 
			  int check = hmartMemberService.idPassCheck(id, password);
			System.out.println(check);
		
		  if(check==1 && hmartMemberDao.findById(id).get().getId().equals("admin")) { 
		  session.setMaxInactiveInterval(60*60*8);
		  
		  session.setAttribute("myid", id); 
		  session.setAttribute("login", id);
		  session.setAttribute("saveok", cbsave);
		  
		  Optional<HMartMemberDto> memberDto = hmartMemberService.getMemberInforById(id);
		  
		  session.setAttribute("name", memberDto.get().getName());
		  
		  return "redirect:/";
		  
		  }else {
		  
		  return "/login/loginFail"; 
		  
		  }
		 
		  }
		
		@GetMapping("/-upload") 
		public String Upload()
		{
			return "/admin/Upload";
		}
		
		@PostMapping("/registration")
		public String upload(@ModelAttribute itemDto dto,
		 MultipartFile upload,HttpSession session) //MultipartFile name = <input name>  파일 업로드의 경우 이름과 dto 이름을 똑같이 할 경우 오류 찾기가 어려워 구분을 위해 dto name과 여기 input의 Name을 다르게 준다.
		{							
			
			//업로드할 save 위치 구하기
			String path = session.getServletContext().getRealPath("/save");
		
			//업로드할 파일 dto 얻기
			dto.setItem_photo(upload.getOriginalFilename());
			
			//실제 업로드
			try {
				upload.transferTo(new File(path+"/"+upload.getOriginalFilename()));
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			hmartAdminDao.insertHMart(dto);
			
			return "/layout/main";
		}
		
	}
