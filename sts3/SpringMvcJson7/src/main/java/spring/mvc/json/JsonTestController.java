package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonTestController {
	
	@GetMapping("/list1")
	@ResponseBody //json으로 처리한 다음 browser로 출력해주는 것(일반 컨트롤러일 경우)
	public Map<String, String> list1()
	{
		Map<String, String> map=new HashMap<String, String>();
		//map은 인터페이스이기 때문에 생성을 못함. 따라서 Hashmap을 생성해줌
		
		map.put("name", "김지영");
		map.put("hp", "010-2222-3333");
		map.put("addr", "전주시 덕진구");
		
		return map;
	}
	
	@GetMapping("/list3")
	public @ResponseBody List<PhotoDto> list3()
	{
		List<PhotoDto> list = new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("샌드위치", "1.jpg"));
		list.add(new PhotoDto("꼬치", "2.jpg"));
		list.add(new PhotoDto("우동", "3.jpg"));
		list.add(new PhotoDto("망고빙수", "11.jpg"));
		list.add(new PhotoDto("콘치즈", "5.jpg"));
		
		return list;
	}
}
