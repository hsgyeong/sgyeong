package board.data.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardDeleteController {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/deletepassform")
	public ModelAndView upassform(
			@RequestParam String num,
			@RequestParam String currentPage)
	{
		ModelAndView model = new ModelAndView();
		
		model.addObject("num", num);
		model.addObject("currentPage", currentPage);
		
		
		model.setViewName("reboard/delpassform");
		
		return model;
	}
	
	@PostMapping("/board/deletepass")
	public String deleteContent(Model model,
			@RequestParam int num,
			@RequestParam int pass,
			@RequestParam int currentPage,
			HttpSession session)
	{	
		
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);
		
		int check = dao.getCheckPass(num, pass);
		
		if (check==1)
		{
			//수정 전에 이전사진 지우기
			String pre_photo=dao.getData(num).getPhoto();
			
			String []pre_fName=pre_photo.split(",");
			for(String f:pre_fName)
			{
				File file = new File(path+"\\"+f);
				file.delete();
			}
			
			dao.deleteReboard(num);
			return "redirect:list";
			
		}else
		{
			return "reboard/passfail";
		}
		
	}
	

}

