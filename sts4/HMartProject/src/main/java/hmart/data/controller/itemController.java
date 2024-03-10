package hmart.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import hmart.data.dao.HMartItemDao;
import hmart.data.dto.ItemDto;

@Controller
public class itemController {

	@Autowired
	HMartItemDao hmartItemDao;
	
	@GetMapping("item/detail")
	public String detail(Long item_id, Model model)
	{
		ItemDto dto = hmartItemDao.getData(item_id);
		
		model.addAttribute("dto", dto);
		
		return "/item/detail";
	}
	
}
