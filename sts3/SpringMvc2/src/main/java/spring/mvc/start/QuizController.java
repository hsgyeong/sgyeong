package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuizController {

	@GetMapping("/happy")
	public String Img()
	{
		
	return "quiz1";	
		
	}
	

	@GetMapping("/hello")
	public String MsgImg(Model model)
	{
		model.addAttribute("msg", "������");
		model.addAttribute("image", "<img src='image/image_01.png' alt=''>");
		
	return "quiz2";	
		
	}
	
	@GetMapping("/hello.do")
	public ModelAndView SgImgs()
	{
		ModelAndView view = new ModelAndView();
		
		view.addObject("msg", "������");
		view.addObject("image", "<img src='image/image_01.png' alt=''>");
		
		view.setViewName("quiz3");
		
	return view;	
		
	}
	
	@GetMapping("/nice/hi")
	public ModelAndView MyInfo()
	{
		ModelAndView model = new ModelAndView();
		
		model.addObject("name", "���ο�");
		model.addObject("age", "25");
		model.addObject("addr", "����� �����");
		
		model.setViewName("quiz4");
		
	return model;	
		
	}
}
