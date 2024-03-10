package answer.data;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.reboard.BoardDao;

@Controller
public class AnswerController {
	
	@Autowired		//db에 추가
	AnswerDao adao;
	
	@Autowired
	BoardDao bdao;

	@PostMapping("/board/ainsert")
	public String answerinsert(@ModelAttribute AnswerDto dto,
			@RequestParam String currentPage,
			HttpSession session) 
	{
		//db추가
		adao.insertAnswer(dto);
		
		 
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
	}
	
	
}
