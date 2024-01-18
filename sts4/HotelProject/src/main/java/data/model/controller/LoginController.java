package data.model.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.model.mapper.LoginMapperInter;

@Controller
public class LoginController {

	@Autowired
	LoginMapperInter mapper;
	
	@GetMapping("/")
	public String start()
	{
		return "/layout/main";
	}
	
	@GetMapping("/loginform")
	public String loginf()
	{
		return "/login/loginform";
	}
	
/*	@PostMapping("login")
	public String login(@RequestParam String id,
			@RequestParam String pass,
			@RequestParam(required = false) String cbsave,
			HttpSession session
			)
	{
		HashMap<String, String> map = new HashMap<>();
		int check = 
		return "";
	} */
	}
