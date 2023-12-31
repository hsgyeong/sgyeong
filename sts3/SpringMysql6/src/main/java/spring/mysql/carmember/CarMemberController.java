package spring.mysql.carmember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.Session;

@Controller
public class CarMemberController {
	
	@Autowired
	CarMemberInter inter;
	
	@Autowired
	private SqlSession session;

	
	@GetMapping("/member/list")
	public String memberStart(Model model)
	{
		//갯수 가져오기
		int count = inter.getTotalCount();
		
		//목록 가져오기
		List<CarMemberDto> list = inter.getAllCarmembers();
 		
		//request에 저장
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "carmember/memberlist";
	}
	
	@GetMapping("/member/addform")
	public String addmember()
	{
		return "carmember/addform";
	}
	
	@PostMapping("/member/addmember")
	public String insertCarMember(@ModelAttribute CarMemberDto dto)
	{
		inter.insertCarMember(dto);
		return"redirect:list";
	}
	
	@GetMapping("/member/delete")
	public String deleteCarMember(String num)
	{
		inter.deleteCarMember(num);
		return "redirect:list";
	}
	
	@GetMapping("/member/update")
	public String updatemember(@RequestParam String num, Model model)
	{
		CarMemberDto dto= inter.getData(num);  //형식이 똑같아야함
		//System.out.println(dto.getNum());
		model.addAttribute("dto", dto);  //오른쪽 dto라는 값을 호출받기 위해서 왼쪽에 "dto"라고 씀
		
		return "carmember/updateform";
	}

	
	  @PostMapping("/member/updatemember") 
	  public String update(@ModelAttribute("dto") CarMemberDto dto) 
	  { 
		 inter.update(dto);
		 
	  return "redirect:list"; 
	  }
	 
	 
	
}
