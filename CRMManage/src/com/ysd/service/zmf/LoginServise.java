package com.ysd.service.zmf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ysd.entity.zmf.LoginReponse;

public interface LoginServise {

	/**
	 * ��½
	 * @param userName
	 * @param userPassWord
	 * @return
	 */
	LoginReponse login(String userName,String userPassWord, HttpServletRequest request,String kaptcha,HttpServletResponse response);
	
	
	
	/**
	 *    	�޸�����
	 * @param userTab
	 * @return
	 */
	Integer updateUserMima(String pwd,String newpwd,String userName);
	
	
}
