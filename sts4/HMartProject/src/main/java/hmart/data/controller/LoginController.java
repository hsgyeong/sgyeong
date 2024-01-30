package hmart.data.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hmart.data.dao.HMartDao;
import hmart.data.dto.HMartMemberDto;

@Controller
public class LoginController {
	
	@Autowired
	HMartDao hmartDao;

	@PostMapping("loginproc")
	public String loginproc(@RequestParam String id, 
			@RequestParam String pass,
			@RequestParam(required=false) String cbsave,
			HttpSession session)
	{	
		int check = hmartDao.loginPassCheck(id, pass);
		
		System.out.println(check);
		
		if(check==1)
		{
			session.setMaxInactiveInterval(60*60*8);
			
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave);
			
			HMartMemberDto memberDto = hmartDao.getDataById(id);
		}
		
		return "";
	}
	
}