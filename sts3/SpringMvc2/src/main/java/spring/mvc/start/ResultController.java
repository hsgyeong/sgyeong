package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultController {
	
	//@GetMapping("/apple/list.do") //list 뒤에 .do나 다른 확장자를 붙이던 다 호출됨
	@GetMapping("/apple/list")
	public String result1(Model model)
	{
		model.addAttribute("myname","홍성경");
		model.addAttribute("myaddr","강남구 역삼동");
		
		return "result1";
	}
	
	@GetMapping("/banana/insert")
	public ModelAndView banana()
	{
		//ModelAndView는 request에 저장하기 위한 Model과 
		//포워드 하기 위한 View를 합쳐놓은 클래스
		ModelAndView mview=new ModelAndView();
		
		//request에 저장
		mview.addObject("java", 88);
		mview.addObject("spring", 99);
		
		//포워드할 jsp파일 지정
		mview.setViewName("result2");
		
		return mview;
	}
	
	@GetMapping("/orange/delete")
	public ModelAndView orange()
	{
		ModelAndView view = new ModelAndView();
		
		view.addObject("sangname", "운동화");
		view.addObject("price", 80000);
		view.addObject("color", "white");
		
		view.setViewName("result3");
	
		return view;
	}
	
	@GetMapping("/shop/detail")
	public String resImage()
	{	
		return "result4";
	}
	
	@GetMapping("/board/insert/data")
	 public String Image()
	 {
		 	return "result5";
	 }
	
	
}
