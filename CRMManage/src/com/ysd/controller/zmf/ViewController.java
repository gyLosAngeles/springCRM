package com.ysd.controller.zmf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {

	@RequestMapping(value="viewlogin",method=RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	@RequestMapping(value="home",method=RequestMethod.GET)
	public String home() {
		return "index";
	}
}
