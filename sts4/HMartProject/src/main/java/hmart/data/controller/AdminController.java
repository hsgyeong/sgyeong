package hmart.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import hmart.data.dao.HMartAdminDaoInter;
import hmart.data.dao.HMartMemberDaoInter;
import hmart.data.dto.HMartMemberDto;
import hmart.data.dto.productDto;
import hmart.data.service.HMartMemberService;

@Controller
public class AdminController {

		@Autowired 
		HMartMemberService hmartMemberService;
		
		@Autowired
		HMartMemberDaoInter hmartMemberDaoInter;
		
		@Autowired
		HMartAdminDaoInter hmartAdminDaoInter;
	
		@GetMapping("admin-login") 
		public String adminLogin()
		{
			return "/admin/adminLogin";
		}
		
		 @PostMapping("admin-loginproc") 
		  public String loginproc(@RequestParam String id,
		  @RequestParam String password,
		  @RequestParam(required=false) 
		  String cbsave, HttpSession session) 
		  { 
			  int check = hmartMemberService.idPassCheck(id, password);
			System.out.println(check+"확인하세용요요요요요용");
		
		  if(check==1 && hmartMemberDaoInter.findById(id).get().getId().equals("admin")) { 
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
		
		@GetMapping("product-upload") 
		public String productUpload()
		{
			return "/admin/productUpload";
		}
		
		@PostMapping("registration")
		public String upload(@ModelAttribute productDto dto,
			@RequestParam("productphoto") MultipartFile productphoto,HttpSession session) //MultipartFile name = dto의 name
		{
			String path = session.getServletContext().getRealPath("/save");
			
			dto.setProductphoto(productphoto.getOriginalFilename());
			
			try {
				productphoto.transferTo(new File(path+"\\"+productphoto.getOriginalFilename()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			hmartAdminDaoInter.save(dto);
			
			return "/hmart/productList";
		}
		
	}

