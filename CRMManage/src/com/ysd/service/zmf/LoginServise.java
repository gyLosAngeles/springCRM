package com.ysd.service.zmf;

import com.ysd.entity.zmf.LoginReponse;

public interface LoginServise {

	/**
	 * ��½
	 * @param userName
	 * @param userPassWord
	 * @return
	 */
	LoginReponse login(String userName,String userPassWord);
}
