package data.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import data.model.mapper.MemberMapperInter;
import data.model.service.MemberServiceInter;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceInter service;
	
	@GetMapping("/")
	public String start()
	{
		return "/layout/main";
		
	}
	
	@GetMapping("/add")
	public String addform()
	{
		return "member/addform";
	}

	
}
