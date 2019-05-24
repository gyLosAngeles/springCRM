package com.ysd.controller.zmf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.UserTab;
import com.ysd.entity.zmf.LoginReponse;
import com.ysd.service.zmf.LoginServise;

@Controller
public class LoginController {

	@Autowired
	private LoginServise loginServise;
	
	@ResponseBody
	@RequestMapping(value="login",method=RequestMethod.POST)
	public LoginReponse selectModule(String userName,String userPassWord, HttpServletRequest request,String kaptcha,HttpServletResponse response) {
		return  loginServise.login(userName, userPassWord,request,kaptcha,response);
	}
	
	
	@ResponseBody
	@RequestMapping(value="loginSelectUserUserTab",method=RequestMethod.POST)
	public UserTab selectUserUserTab(Integer userId) {
		// TODO Auto-generated method stub
		return loginServise.selectUserUserTab(userId);
	}

	@ResponseBody
	@RequestMapping(value="loginUpdateUserMima",method=RequestMethod.POST)
	public Integer updateUserMima(UserTab userTab) {
		// TODO Auto-generated method stub
		return loginServise.updateUserMima(userTab);
	}
}
