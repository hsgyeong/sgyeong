package hmart.data.controller;

import java.util.HashMap;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hmart.data.dao.HMartMemberDaoInter;
import hmart.data.dto.HMartMemberDto;
import hmart.data.service.HMartMemberService;

@Controller
public class LoginController {
	
	@Autowired
	HMartMemberDaoInter hmartMemberDaoInter;
	
	@Autowired
	HMartMemberService hmartMemberService;
	
	@RequestMapping("/")
	public String home(HttpServletRequest request, 
			HttpSession session,
			Model  model)
	{
		String loginSuccess = (String) session.getAttribute("loginSuccess");
		
		if(loginSuccess==null)
		{
			return "/login/login";
		}
		else
		{
			String id = (String)session.getAttribute("id");
			
			if(id != null)
			{
				Optional<HMartMemberDto> memberOptional = hmartMemberService.getUserNameById(id); 
				
				if(memberOptional.isPresent())
				{	
					String name = memberOptional.get().getName();
				
					model.addAttribute("name", name);
				}
				return "/";
			}
		}
		return "/login/login";
	}


	  @PostMapping("loginproc") 
	  public String loginproc(@RequestParam String id,
	  @RequestParam String password,
	  @RequestParam(required=false) 
	  String cbsave, HttpSession session) 
	  { 
		  int check = hmartMemberService.loginPassCheck(id, password);
	  
//	System.out.println(check+"확인하세용요요요요요용");
	
	  if(check==1) { 
	  session.setMaxInactiveInterval(60*60*8);
	  
	  session.setAttribute("myid", id); 
	  session.setAttribute("loginok", id);
	  session.setAttribute("saveok", cbsave);
	  
	  Optional<HMartMemberDto> memberDto = hmartMemberService.getMemberInforById(id);
	  
	  session.setAttribute("name", memberDto.get().getName());
	  
	  return "redirect:/";
	  
	  }else {
	  
	  return "/login/loginFail"; 
	  
	  }
	 
	  }
}