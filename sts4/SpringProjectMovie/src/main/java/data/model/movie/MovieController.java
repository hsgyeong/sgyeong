package data.model.movie;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.model.mapper.MovieMapperInter;

@Controller
public class MovieController {

	@Autowired
	MovieMapperInter mapper;
	
	@GetMapping("/")
	public String start()
	{
		return "redirect:movie/list";
	}
	
	@GetMapping("/movie/list")
	public ModelAndView list()
	{
		ModelAndView model = new ModelAndView();
		
		int totalCount = mapper.getTotalCount();
		List<MovieDto> list = mapper.getAllMovies();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		model.setViewName("movie/movielist");
		
		return model;
	}
	
	@GetMapping("/movie/writeform")
	public String form()
	{
		return "movie/addform";
	}
	
	@PostMapping("/movie/insert") //modelattribute는 addform의 name과 dto가 일치할 때 값을 넣어주기 위해 쓰는것
	public String insert(@ModelAttribute MovieDto dto,//입력한 정보를 받고싶을때
			@RequestParam MultipartFile poster,
			HttpSession request)
	{
		String path = request.getServletContext().getRealPath("/moviephoto");
		System.out.println(path);
		
		if(poster.getOriginalFilename().equals(""))
			dto.setMv_poster(null);
		else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			String postername = sdf.format(new Date())+poster.getOriginalFilename();
			dto.setMv_poster(postername);
			
			try {
				poster.transferTo(new File(path+"\\"+postername));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.insertMovie(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/movie/detail")
	public ModelAndView detail(int num)
	{	
		ModelAndView model = new ModelAndView();
		
		MovieDto dto = mapper.getData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("movie/detail");
		
		return model;
	}
	
	@GetMapping("/movie/updateform")
	public String updateform()
	{
		return "/movie/updateform";
	}
	
	@PostMapping("/movie/update")
	public String update(@ModelAttribute MovieDto dto)
	{
		mapper.updateMovie(dto);
		
		return "redirect:list";
	} 
	
	
	@GetMapping("/movie/delete")
	public String delete(@RequestParam int num,
			HttpServletRequest request)
	{
		String poster = mapper.getData(num).getMv_poster();
		
		if(!poster.equals(null))
		{
			String path=request.getServletContext().getRealPath("/moviephoto");
			
			File file = new File(path+"\\"+poster);
			
			file.delete();
			
		}
		
		mapper.deleteMovie(num);
		
		return "redirect:list";
		
	}
	
	
	@GetMapping("/movie/redirect")
	public String redirect()
	{
		return "movie/movielist";
	}
}
