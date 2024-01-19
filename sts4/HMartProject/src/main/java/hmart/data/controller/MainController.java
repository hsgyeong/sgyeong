package hmart.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import hmart.data.dao.HMartDao;

@Controller
public class MainController {

	@Autowired
	HMartDao hmartDao;

	@GetMapping("/")
	public String main()
	{
		return "/layout/main";
	}
	
	@GetMapping("/member/join")
	public String join()
	{
		return "/login/join";
	}
}
