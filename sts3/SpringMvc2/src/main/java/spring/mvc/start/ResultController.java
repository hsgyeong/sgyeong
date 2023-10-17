package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultController {
	
	//@GetMapping("/apple/list.do") //list �ڿ� .do�� �ٸ� Ȯ���ڸ� ���̴� �� ȣ���
	@GetMapping("/apple/list")
	public String result1(Model model)
	{
		model.addAttribute("myname","ȫ����");
		model.addAttribute("myaddr","������ ���ﵿ");
		
		return "result1";
	}
	
	@GetMapping("/banana/insert")
	public ModelAndView banana()
	{
		//ModelAndView�� request�� �����ϱ� ���� Model�� 
		//������ �ϱ� ���� View�� ���ĳ��� Ŭ����
		ModelAndView mview=new ModelAndView();
		
		//request�� ����
		mview.addObject("java", 88);
		mview.addObject("spring", 99);
		
		//�������� jsp���� ����
		mview.setViewName("result2");
		
		return mview;
	}
	
	@GetMapping("/orange/delete")
	public ModelAndView orange()
	{
		ModelAndView view = new ModelAndView();
		
		view.addObject("sangname", "�ȭ");
		view.addObject("price", 80000);
		view.addObject("color", "white");
		
		view.setViewName("result3");
	
		return view;
	}
	
	@GetMapping("/shop/detail")
	public String resImage()
	{	
		return "result4";
	}
	
	@GetMapping("/board/insert/data")
	 public String Image()
	 {
		 	return "result5";
	 }
	
	
}
