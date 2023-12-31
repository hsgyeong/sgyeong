package spring.mysql.mycar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CarController {
	
	@Autowired
	MyCarDao dao;
	
	@GetMapping("/kakao/list")
	public String list(Model model)
	{
		//dao로부터 총 개수 가져오기
		int totalCount = dao.getTotalCount();
		
		//목록 가져오기
		List<MyCarDto> list = dao.getAllCars();
		
		//request에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list",list);
	
		
		return "car/carlist";
	}
	
	@GetMapping("/kakao/writeform")
	public String carform()
	{
		return "car/writeform";
	}
	
	
	//insert 
	@PostMapping("/kakao/write") 
	public String write(@ModelAttribute("dto") MyCarDto dto)
	{
		dao.insertCar(dto);
		
		return "redirect:list";
	}
	
	//update
	
	
	/* 방식1  
	  
	  @GetMapping("/kakao/updateform") 
	  public ModelAndView carupdate(@RequestParam String num) 
	  { 
	  	ModelAndView mview = new ModelAndView();
	 	
	  	MyCarDto dto = dao.getData(num);
	  
	  	mview.addObject("dto", dto);
	  
	  	mview.setViewName("car/updateform");  ModelAndView 는 넘기는 주소를 적어줘야함
	  
	  	return mview; } */
	
	@GetMapping("/kakao/updateform")
	public String carupdate(@RequestParam String num, Model model)
	{
		MyCarDto dto = dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "car/updateform";  //String으로 넘겨버리면 됨
	}
	 	
	
	@PostMapping("/kakao/update")
	public String update(@ModelAttribute("dto")  MyCarDto dto)
	{
		dao.updateCar(dto);
		
		return "redirect:list";
	}
	
	//delete
	@GetMapping("/kakao/delete")
	public String delete(String num) //@RequestParam 생략 가능
	{
		dao.deleteCar(num);
		
		return "redirect:list";
	}
}
