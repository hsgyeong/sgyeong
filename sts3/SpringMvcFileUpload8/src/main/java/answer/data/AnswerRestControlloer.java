package answer.data;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.mvc.reboard.BoardDao;

@RestController
public class AnswerRestControlloer {

	@Autowired
	AnswerDao adao;
	
	@Autowired
	BoardDao bdao;
	
	 @GetMapping("/board/adelete")
	  public HashMap<String, Integer> deleteAnswer(
			  @RequestParam int idx,
			  @RequestParam String pass,
			  @RequestParam int num)
	  {
		int check = adao.getCheckPass(idx, pass);
		if(check==1)
		{
			adao.deleteAnswer(idx);
			
		}
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("check",check);  //{"check":1}
			
		 
		 return map;
	  }
	  
}
