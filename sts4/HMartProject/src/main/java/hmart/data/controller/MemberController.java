package hmart.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import hmart.data.dao.HMartMemberDao;
import hmart.data.dao.HMartMemberDaoInter;
import hmart.data.dto.HMartMemberDto;

@Controller
public class MemberController {

	@Autowired
	HMartMemberDao memberDao;
	
	@PostMapping("/member/join-success")
	public String join(@ModelAttribute HMartMemberDto memberDto)
	{
		memberDao.insertMember(memberDto);
		
		return "/login/success";
	}
	
	@GetMapping("/member/success")
	public String joinSuccess()
	{
		return "redirect:success";
	}
	
}
