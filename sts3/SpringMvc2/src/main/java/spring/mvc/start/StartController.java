package spring.mvc.start;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.RequestScope;

@Controller   //만들기 전에 bean에 등록
public class StartController {
	
	//start.jsp로 가기위한 메소드(포워드)
	
	@GetMapping("start")
	@RequestScope
	public String start(Model model)
	{	
		//Model: request에 데이터를 저장하기 위한 인터페이스
		//서블릿에서 하던 request.setAttribute와 같다
		
		model.addAttribute("name", "김영환");
		model.addAttribute("addr", "서울시 강남구");
		return "start";  //WEB-INF/day1005/start.jsp를 의미함
		
	}

}
