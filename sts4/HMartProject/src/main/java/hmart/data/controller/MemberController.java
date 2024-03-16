package hmart.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hmart.data.dao.HMartMemberDao;
import hmart.data.dao.HMartMemberDaoInter;
import hmart.data.dto.HMartMemberDto;
import hmart.data.service.HMartMemberService;

@Controller
public class MemberController {

	@Autowired
	HMartMemberDao memberDao;
	
	@Autowired
	HMartMemberService hmartMemberService;
	
	@GetMapping("/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheck(@RequestParam String id)
	{
		Map<String, Integer> map = new HashMap<>();
		int i = hmartMemberService.getSearchId(id);
		
		map.put("count", i);
		
		return map;
		
	}
	/*
	@PostMapping("/check-password")
	public String checkPassword(@RequestParam("pass1") String pass1, @RequestParam("pass2") String pass2)
	{
		if(pass1 == null || pass1.isEmpty()||pass2 == null || pass2.isEmpty())
		{
			return "비밀번호를 확인해주세요.";
		}
		else
			return "";
	}*/
	
	@PostMapping("/join-success")
	public String join(@ModelAttribute HMartMemberDto memberDto)
	{
		memberDao.insertMember(memberDto);
		
		return "/login/joinsuccess";
	}
	

}
