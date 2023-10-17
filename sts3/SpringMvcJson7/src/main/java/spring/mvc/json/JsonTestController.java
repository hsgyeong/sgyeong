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
	@ResponseBody //json���� ó���� ���� browser�� ������ִ� ��(�Ϲ� ��Ʈ�ѷ��� ���)
	public Map<String, String> list1()
	{
		Map<String, String> map=new HashMap<String, String>();
		//map�� �������̽��̱� ������ ������ ����. ���� Hashmap�� ��������
		
		map.put("name", "������");
		map.put("hp", "010-2222-3333");
		map.put("addr", "���ֽ� ������");
		
		return map;
	}
	
	@GetMapping("/list3")
	public @ResponseBody List<PhotoDto> list3()
	{
		List<PhotoDto> list = new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("������ġ", "1.jpg"));
		list.add(new PhotoDto("��ġ", "2.jpg"));
		list.add(new PhotoDto("�쵿", "3.jpg"));
		list.add(new PhotoDto("�������", "11.jpg"));
		list.add(new PhotoDto("��ġ��", "5.jpg"));
		
		return list;
	}
}
