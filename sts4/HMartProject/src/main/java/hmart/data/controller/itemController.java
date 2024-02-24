package hmart.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import hmart.data.dao.HMartItemDao;
import hmart.data.dto.itemDto;

@Controller
public class itemController {

	@Autowired
	HMartItemDao hmartItemDao;
	
	@GetMapping("/item/Detail")
	public String detail(Long num, Model model)
	{
		itemDto dto = hmartItemDao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "itemDetail";
	}
	
}
