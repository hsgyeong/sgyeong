package hmart.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import hmart.data.dao.HMartAdminDao;
import hmart.data.dao.HMartMainDao;
import hmart.data.dto.ItemDto;

@Controller
public class MainController {

	@Autowired
	HMartAdminDao hmartAdminDao;
	
	@Autowired
	HMartMainDao hmartMainDao;

	@GetMapping("/")
	public String main(Model model)
	{
		List<ItemDto> itemList = hmartMainDao.getAllDatas();
		
		model.addAttribute("list", itemList);
		model.addAttribute("totalCount", itemList.size());
		
		return "/layout/main";
	}

/*	@GetMapping("/mainList")
	public String mainList(Model model)
	{	
		List<itemDto> itemList = hmartMainDao.getAllDatas();
		
		model.addAttribute("list", itemList);
		model.addAttribute("totalCount", itemList.size());
		
		return "/layout/mainList";
	}
*/
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
