package com.ysd.service.zmf;

import com.ysd.entity.UserTab;
import com.ysd.entity.zmf.LoginReponse;

public interface LoginServise {

	/**
	 * ��½
	 * @param userName
	 * @param userPassWord
	 * @return
	 */
	LoginReponse login(String userName,String userPassWord);
	
	
	

	/**
	 * 		����id��ѯ�û��Ƿ����
	 * @param userTab
	 * @return
	 */
	UserTab	selectUserUserTab(Integer userId);
	
	/**
	 *    	�޸�����
	 * @param userTab
	 * @return
	 */
	Integer updateUserMima(UserTab userTab);
	
	
}
