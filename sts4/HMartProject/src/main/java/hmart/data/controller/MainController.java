package hmart.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import hmart.data.dao.HMartAdminDao;
import hmart.data.dao.HMartMainDao;
import hmart.data.dto.productDto;

@Controller
public class MainController {

	@Autowired
	HMartAdminDao hmartAdminDao;
	
	@Autowired
	HMartMainDao hmartMainDao;

	@GetMapping("/")
	public String main()
	{
		return "/layout/main";
	}

	@GetMapping("/mainList")
	public String mainList(Model model)
	{	
		List<productDto> productList = hmartMainDao.getAllDatas();
		
		model.addAttribute("list", productList);
		model.addAttribute("totalCount", productList.size());
		
		return "/layout/mainList";
	}
	
	@GetMapping("/join")
	public String join()
	{
		return "/login/join";
	}

	@GetMapping("/login")
	public String login()
	{
		return "/login/login";
	}
	
	
}
