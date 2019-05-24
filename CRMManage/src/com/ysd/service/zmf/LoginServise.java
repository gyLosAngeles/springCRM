package com.ysd.service.zmf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ysd.entity.UserTab;
import com.ysd.entity.zmf.LoginReponse;

public interface LoginServise {

	/**
	 * 登陆
	 * @param userName
	 * @param userPassWord
	 * @return
	 */
	LoginReponse login(String userName,String userPassWord, HttpServletRequest request,String kaptcha,HttpServletResponse response);
	
	
	

	/**
	 * 		根据id查询用户是否存在
	 * @param userTab
	 * @return
	 */
	UserTab	selectUserUserTab(Integer userId);
	
	/**
	 *    	修改密码
	 * @param userTab
	 * @return
	 */
	Integer updateUserMima(UserTab userTab);
	
	
}
