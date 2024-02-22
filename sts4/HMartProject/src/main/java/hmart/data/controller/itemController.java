package hmart.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import hmart.data.dao.HMartMainDao;

@Controller
public class itemController {

	@Autowired
	HMartMainDao hmartMainDao;
	
	@GetMapping("/")
}
