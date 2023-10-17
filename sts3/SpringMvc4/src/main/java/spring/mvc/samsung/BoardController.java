package spring.mvc.samsung;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller 
@RequestMapping("/board")
public class BoardController {
	//모든 경로의 내용은 controller에 
	@GetMapping("/form1")
	public String form1()
	{
		return "board/writeForm";
	}
	
	@PostMapping("/process")  //requestparam > requestgetpara
	public ModelAndView process1(@RequestParam String name,
			@RequestParam String date,
			@RequestParam String gender, 
			@RequestParam(defaultValue = "행복한 하루 보내세요") String msg,
			/* required =true가 기본값인데 숨겨져있음, 항목이 없어도 에러가 안 나게 하려면 false */
			/*	@RequestParam(required=false) String msg,*/ 
			@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name",name);
		model.addObject("date",date);
		model.addObject("gender",gender);
		model.addObject("msg",msg);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("board/result"); //board의 result로 이동 (폴더명/파일명)
		
		return model;
	}
	
	@GetMapping("/result2")
	public String result2(Model model)
	{
		
		model.addAttribute("myimg1","../image/whale.png");
		model.addAttribute("title","좋아하는 이미지");
		
		
		return "board/result2";
	}
	
	@GetMapping("/result3")
	public String result3(Model model)
	{
		
		return "board/result3";
	}
}
