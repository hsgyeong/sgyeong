package spring.mvc.munje;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.dto.InfoDto;

@Controller
public class InfoController {

	@GetMapping("/info/infoForm")
	public String form()
	{
		return "info/infoForm";
	}
	
	@PostMapping("/info/process")
	public String process(@ModelAttribute("dto") InfoDto dto)
	{
	
		return "info/infoWrite";
	}
	

}
