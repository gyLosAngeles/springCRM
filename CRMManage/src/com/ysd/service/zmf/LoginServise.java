package com.ysd.service.zmf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ysd.entity.zmf.LoginReponse;

public interface LoginServise {

	/**
	 * µÇÂ½
	 * @param userName
	 * @param userPassWord
	 * @return
	 */
	LoginReponse login(String userName,String userPassWord, HttpServletRequest request,String kaptcha,HttpServletResponse response);
	
	
	
	/**
	 *    	ÐÞ¸ÄÃÜÂë
	 * @param userTab
	 * @return
	 */
	Integer updateUserMima(String pwd,String newpwd,String userName);
	
	
}
