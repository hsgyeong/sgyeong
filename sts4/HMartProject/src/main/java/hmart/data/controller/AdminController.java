package hmart.data.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

		@GetMapping("admin-login") 
		public String adminLogin()
		{
			return "/admin/adminLogin";
		}
		
		@GetMapping("product-upload") 
		public String productUpload()
		{
			return "/admin/productUpload";
		}
	}

