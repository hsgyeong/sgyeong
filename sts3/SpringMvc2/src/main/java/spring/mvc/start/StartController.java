package spring.mvc.start;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.RequestScope;

@Controller   //����� ���� bean�� ���
public class StartController {
	
	//start.jsp�� �������� �޼ҵ�(������)
	
	@GetMapping("start")
	@RequestScope
	public String start(Model model)
	{	
		//Model: request�� �����͸� �����ϱ� ���� �������̽�
		//���������� �ϴ� request.setAttribute�� ����
		
		model.addAttribute("name", "�迵ȯ");
		model.addAttribute("addr", "����� ������");
		return "start";  //WEB-INF/day1005/start.jsp�� �ǹ���
		
	}

}