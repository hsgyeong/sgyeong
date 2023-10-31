package mycar.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.apache.bcel.classfile.Field;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyCarController {
	
	@Autowired
	MyCarDao dao;
	
	@GetMapping("/car/carlist") //시작
	public ModelAndView list()
	{
		ModelAndView model = new ModelAndView();
		
		List<MyCarDto> list = dao.getAllDatas();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("carlist");  //포워드
		
		return model;
	}
	
	@GetMapping("/car/carform")
	public String form()
	{
		return "addform";
	}
	
	@PostMapping("/car/insert")
	public String insert(@ModelAttribute MyCarDto dto, MultipartFile carupload,
			HttpSession session)
	{
		
		//업로드할 save 위치 구하기
		String path=session.getServletContext().getRealPath("/save");
		
		//업로드한 파일 dto 얻기
		dto.setCarphoto(carupload.getOriginalFilename());
		
		//실제 업로드				//역슬래시 두 개 또는 슬래시 하나
		try {
			carupload.transferTo(new File(path+"\\"+carupload.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dao.insertMyCar(dto);
	
		return "redirect:carlist";
	}
	
	@GetMapping("/car/detail")
	public String detail(Long num, Model model)
	{
		MyCarDto dto = dao.getData(num);
		
		model.addAttribute("dto", dto);  //model.getAttribute를 넘기겠다 dto를 detail 페이지로
		return "detail";
	}
	
	@GetMapping("/car/carupdate")
	public String uform(@RequestParam Long num,
			Model model)
	{
		MyCarDto dto = dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		
		return "uform";
	}
	
	@PostMapping("/car/update")
	public String update(@ModelAttribute MyCarDto dto)
	{
		dao.updateMyCar(dto);
			
		return "redirect:carlist";
	}
	
	@GetMapping("/car/delete")
	public String delete(@RequestParam Long num)
	{
		dao.deleteMyCar(num);
		
		return "redirect:carlist";
	}
	
	

}
