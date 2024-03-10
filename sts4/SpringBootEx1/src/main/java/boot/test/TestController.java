package boot.test;

import java.util.List;
import java.util.Vector;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.mvc.ex1.ShopDto;
import boot.mvc.ex1.TestDto;

@RestController
public class TestController {

	@GetMapping("/test")
	public TestDto hello()
	{
		TestDto dto = new TestDto();
		dto.setName("서민지");
		dto.setAddr("서울시 서초구");
		
		return dto;
	}
	
	@GetMapping("/shop/list")
	public List<ShopDto> list()
	{
		List<ShopDto> list = new Vector<>();
		
		ShopDto d1 = new ShopDto();
		d1.setSang("조청유과");
		d1.setSu(2);
		d1.setDan(1500);
		
		ShopDto d2 = new ShopDto();
		d2.setSang("꿀꽈배기");
		d2.setSu(13);
		d2.setDan(1400);
		
		list.add(d2);
		
		return list;
		
	}
}
