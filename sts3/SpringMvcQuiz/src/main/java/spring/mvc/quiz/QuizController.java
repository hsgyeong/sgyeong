package spring.mvc.quiz;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.quizdto.ShopDto;

@Controller
public class QuizController {
	

	@GetMapping("/ilike/movie") //원래 파일의 위치를 안 들키기 위해서 가상주소 사용
	public String titlemessage()
	{
		return "quiz1";
	}
	
	@PostMapping("/ilike/result")
	public ModelAndView title(@RequestParam Map<String,String> map)
	{	
		ModelAndView model = new ModelAndView();
		
		model.addObject("title", map.get("title"));
		model.addObject("image", map.get("image"));
		
		model.setViewName("result1");
		
		return model;
	}
	
	@GetMapping("/school/myinfo")
	public String myinfo()
	{
		return "quiz2";
	}
	
	@GetMapping("/school/info")
	public ModelAndView read2(String name,String school,String grade,String addr)
	{
		ModelAndView mview = new ModelAndView();
		
		mview.addObject("name", name);
		mview.addObject("school", school);
		mview.addObject("grade", grade);
		mview.addObject("addr", addr);
		
		mview.setViewName("result2");
		
		return mview;
	}
	
	@GetMapping("shop/ipgo")
	public String ipgo()
	{
		return "quiz3";
	}
	
	@PostMapping("shop/sangpum")
	public String shop(@ModelAttribute("dto") ShopDto dto)
	{
		
		return "result3";
	}
	
	@GetMapping("mysinsang")
	public String mysinsang()
	{
		return "quiz4";
	}
	
	
	@PostMapping("info") 
	public ModelAndView info(@RequestParam Map<String, String> map)
	{
		ModelAndView model = new ModelAndView();
		
		model.addObject("name", map.get("name"));
		model.addObject("age", map.get("age"));
		model.addObject("blood", map.get("blood"));
		model.addObject("addr", map.get("addr"));
		
		model.setViewName("result4");
		
		return model;
	}
	 
	  
	 
}
