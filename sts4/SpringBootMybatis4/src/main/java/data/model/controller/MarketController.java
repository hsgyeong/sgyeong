package data.model.controller;

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

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;
import data.model.service.MarketService;

@Controller
public class MarketController {

/*	@Autowired
	MarketMapperInter mapper;  */
	
	@Autowired
	MarketService service;
	
	@GetMapping("/")
	public String start()
	{
		
		return "redirect:market/list";
	}
	
	@GetMapping("/market/list")
	public ModelAndView list()
	{
		ModelAndView model = new ModelAndView();
		
		//db로부터 총개수 얻기
		int totalCount=service.getTotalCount();
		List<MarketDto> list = service.getAllSangpums();
		
		//저장
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		//포워드
		model.setViewName("market/marketlist");
		return model;
		
	}
	
	@GetMapping("/market/writeform")
	public String form()
	{
		return "market/addform";
	}
	
	
	@PostMapping("/market/insert")  //sts3 8번, 5번 참고
	public String insert(@ModelAttribute MarketDto mdto,
			@RequestParam  MultipartFile photo,
			HttpSession request)
	{
		
		//업로드할 save 위치 구하기
		String path = request.getServletContext().getRealPath("/save");
		System.out.println(path);
		
		
		if(photo.getOriginalFilename().equals(""))
			mdto.setPhotoname("no");
		else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname = sdf.format(new Date())+photo.getOriginalFilename();
			mdto.setPhotoname(photoname);
		
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		service.insertMarket(mdto);
		
		return "redirect:list";
		
	}
	
	@GetMapping("/market/updateform")
	public String updateform(@RequestParam String num, Model model)
	{
		MarketDto mdto = service.getData(num);
		
		model.addAttribute("mdto", mdto);
		
		return "market/updateform";
	}
	
	@PostMapping("/market/update")
	public String update(@ModelAttribute MarketDto mdto,
			@RequestParam("photoupload") MultipartFile photoupload,
			@RequestParam int currentPage,
			@RequestParam String num,
			HttpSession session)
	{
		String pre_photo = service.getData(num).getPhotoname();
		
		String path = session.getServletContext().getRealPath("/save");
		
	String []pre_fName = pre_photo.split(",");
	for(String f:pre_fName)
	{
		File file = new File(path+"\\"+f);
		file.delete();
	}
	
		
		mdto.setPhotoname(photoupload.getOriginalFilename());
		
		if(photoupload != null && !photoupload.isEmpty())
		{
			mdto.setPhotoname(photoupload.getOriginalFilename());
			
			try {
				photoupload.transferTo(new File(path+"\\"+photoupload.getOriginalFilename()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		service.updateMarket(mdto);
		
		return "redirect:list";
	}
	
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num,
			HttpServletRequest request)
	{
		String photo = service.getData(num).getPhotoname();
		
		if(!photo.equals("no"))
		{
			String path=request.getServletContext().getRealPath("/save");
			
			File file = new File(path+"\\"+photo);
			
			if(file.exists()) {
			file.delete();
			}
		}
		
		service.deleteMarket(num);
		
		return "redirect:list";
	}
	
	
/*	@GetMapping("/market/delete")
	public String delete(@RequestParam String num,
			HttpServletRequest request)
	{
		MarketDto dto = service.getData(num);
		
		String photo = dto.getPhotoname();
		
		if(photo != null)
		{
			String path=request.getServletContext().getRealPath("/save");
			
			File file = new File(path+"\\"+photo);
			
			if(file.exists()) {
			file.delete();
			}
		} */
}
