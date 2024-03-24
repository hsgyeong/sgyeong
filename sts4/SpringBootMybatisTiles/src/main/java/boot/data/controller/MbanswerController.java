package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MbanswerDto;
import boot.data.mapper.MbanswerMapperInter;
import boot.data.service.MemberService;

@RestController
@RequestMapping("/mbanswer") //이름 복잡해지니까 쉽도록
public class MbanswerController {

	@Autowired
	MbanswerMapperInter mapper;
	
	@Autowired
	MemberService mservice;
	
		//포워드에서 포워드가 아닌 걸로 오는 순간 void는 result값?
	@PostMapping("/ainsert")
	public void insert(@ModelAttribute MbanswerDto dto,
					   HttpSession session){
		//세션에 로그인한 id
		String myid = (String)session.getAttribute("myid");
		
		//아이디에 대한 작성자
		String name = mservice.getName(myid);
		
		dto.setMyid(myid);
		dto.setName(name);
		
		//insert
		mapper.insertMbanswer(dto);
		
	}
	
	@GetMapping("/alist")
	public List<MbanswerDto> alist(@RequestParam String num){
		//전체 리스트를 리턴해줌
		return mapper.getAllAnswers(num);
	}
	
	@GetMapping("/deleteasw")
	@ResponseBody
	public void deleteanswer(@RequestParam String idx,
							 HttpSession session){
		mapper.deleteAnswer(idx);
	}
	
	//수정창 content띄우기
	@GetMapping("/adata")
	public MbanswerDto getData(String idx){
		return mapper.getAnswer(idx);
	}

	//수정
	@PostMapping("/aupdate")
	public void aupdate(@ModelAttribute MbanswerDto dto){
		mapper.updateMbanswer(dto);
	}
	
}
