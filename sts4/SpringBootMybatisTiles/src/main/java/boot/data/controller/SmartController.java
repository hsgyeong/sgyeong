package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.SmartDto;
import boot.data.mapper.SmartMapperInter;
import boot.data.service.SmartService;

@Controller
public class SmartController {
	
	@Autowired
	SmartService service;
	
	@GetMapping("/smart/list")
	public ModelAndView list(
			@RequestParam(value="currentPage", defaultValue = "1")int currentPage)
	{
		ModelAndView model = new ModelAndView();
		
		int totalCount = service.getTotalCount();
		int totalPage;
		int startPage;
		int endPage;
		int startNum;
		int perPage=5;
		int perBlock=5;
		
		//총 페이지 수 구하기
		//총 글의 개수 / 한 페이지당 보여질 개수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지 필요)
		totalPage = totalCount/perPage+(totalCount%perPage==0?0:1);
		
		//각 블럭당 보여야 할 시작페이지
		//perBlock=5일 경우는 현재페이지 1~5 시작:1 끝:5
		//현재페이지 13  시작:11  끝:15
		startPage = (currentPage-1)/perBlock*perBlock+1;
		
		endPage = startPage+perBlock-1;
		
		//총 페이지가 23일 경우 마지막 블럭은 23이다.
		if(endPage>totalPage)
			endPage = totalPage;
		
		//각 페이지에서 보여질 시작번호
		//1페이지:0, 2페이지:5, 3페이지:10...
		startNum = (currentPage-1)*perPage;
		
		//각 페이지에서 출력할 시작번호
		int no = totalCount-(currentPage-1)*perPage;
		
		//System.out.println(startPage+","+perPage);
		
		//각 페이지에서 필요한 게시글 가져오기
		List<SmartDto> list = service.getList(startPage, perPage);
		
		
		model.addObject("totalCount", totalCount);
		model.addObject("startPage", startPage);
		model.addObject("perPage", perPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("currentPage", currentPage);
		model.addObject("no",no);
		model.addObject("list", list);
		
		model.setViewName("/smartshop/list");
		
		return model;
		
	}
	
	@GetMapping("/smart/form")
	public String form()
	{
		return "/smartshop/smartform";
	}
	
	@PostMapping("/smart/insert")
	public String insert(@ModelAttribute SmartDto dto)
	{
		service.insertSshop(dto);
		
		return "/smartshop/list";
	}
}
