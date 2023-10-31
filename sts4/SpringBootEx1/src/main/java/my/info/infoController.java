package my.info;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class infoController {

	@ResponseBody	
	@GetMapping("/my/info")
	public HashMap<String, String> myinfo()
	{
		HashMap<String, String> info = new HashMap<>();
		
		info.put("name", "홍성경");
		info.put("age", "22");
		info.put("addr", "서울시 강동구");
		
		return info;
				
	}
}
