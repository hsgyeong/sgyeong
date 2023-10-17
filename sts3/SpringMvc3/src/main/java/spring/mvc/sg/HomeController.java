package spring.mvc.sg;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String start()
	{		
		//return "redirect:login/form";  //return "form"
		return "start";
	}
	
	@GetMapping("/login/form")
	public String form()
	{
		return "form";
	}
	
	@GetMapping("/login/read")
	public String process(Model model, @RequestParam(value="myid") String id, 
			@RequestParam(value="mypass") String pass)
	{	
		model.addAttribute("id",id);
		String msg="";
		
		if(pass.equals("1234"))
			msg="�α��μ���";
		else
			msg="�α��� ����";
		
		model.addAttribute("msg",msg);
		
		return "result";
	
	}
	
	
}
