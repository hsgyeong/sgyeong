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
		//dao�κ��� �� ���� ��������
		int totalCount = dao.getTotalCount();
		
		//��� ��������
		List<MyCarDto> list = dao.getAllCars();
		
		//request�� ����
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
	
	
	/* ���1  
	  
	  @GetMapping("/kakao/updateform") 
	  public ModelAndView carupdate(@RequestParam String num) 
	  { 
	  	ModelAndView mview = new ModelAndView();
	 	
	  	MyCarDto dto = dao.getData(num);
	  
	  	mview.addObject("dto", dto);
	  
	  	mview.setViewName("car/updateform");  ModelAndView �� �ѱ�� �ּҸ� ���������
	  
	  	return mview; } */
	
	@GetMapping("/kakao/updateform")
	public String carupdate(@RequestParam String num, Model model)
	{
		MyCarDto dto = dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "car/updateform";  //String���� �Ѱܹ����� ��
	}
	 	
	
	@PostMapping("/kakao/update")
	public String update(@ModelAttribute("dto")  MyCarDto dto)
	{
		dao.updateCar(dto);
		
		return "redirect:list";
	}
	
	//delete
	@GetMapping("/kakao/delete")
	public String delete(String num) //@RequestParam ���� ����
	{
		dao.deleteCar(num);
		
		return "redirect:list";
	}
}