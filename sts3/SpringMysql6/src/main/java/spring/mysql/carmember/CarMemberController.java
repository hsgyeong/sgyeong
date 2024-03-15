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
		//���� ��������
		int count = inter.getTotalCount();
		
		//��� ��������
		List<CarMemberDto> list = inter.getAllCarmembers();
 		
		//request�� ����
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
		CarMemberDto dto= inter.getData(num);  //������ �Ȱ��ƾ���
		//System.out.println(dto.getNum());
		model.addAttribute("dto", dto);  //������ dto��� ���� ȣ��ޱ� ���ؼ� ���ʿ� "dto"��� ��
		
		return "carmember/updateform";
	}

	
	  @PostMapping("/member/updatemember") 
	  public String update(@ModelAttribute("dto") CarMemberDto dto) 
	  { 
		 inter.update(dto);
		 
	  return "redirect:list"; 
	  }
	 
	 
	
}