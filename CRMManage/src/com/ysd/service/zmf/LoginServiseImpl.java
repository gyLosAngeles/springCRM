package com.ysd.service.zmf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ysd.dao.zmf.UserTabMapper;
import com.ysd.entity.UserTab;
import com.ysd.entity.zmf.LoginReponse;
@Service
public class LoginServiseImpl implements LoginServise {

	@Autowired
	private UserTabMapper userTabMapper;
	@Autowired
	private LoginReponse loginReponse;
	
	public LoginReponse login(String userName, String userPassWord) {
		
		UserTab selectUserByuserName = userTabMapper.selectUserByuserName(userName);
		UserTab userTab = new UserTab();
		if(selectUserByuserName==null) {
			loginReponse.setMessage("用户名不存在");
			loginReponse.setSuccess(false);
		}else if(!selectUserByuserName.getUserPassWord().equals(userPassWord)) {
			loginReponse.setMessage("密码错误");
			loginReponse.setSuccess(false);
			Integer userPassWrongCout = selectUserByuserName.getUserPassWrongCout()+1;
			if(userPassWrongCout==3) {
				userTab.setUserIsLockout(1);
			}
			userTab.setUserName(userName);
			userTab.setUserPassWrongCout(userPassWrongCout);
			userTabMapper.updateUser(userTab);
		}else if(selectUserByuserName.getUserIsLockout()==null||selectUserByuserName.getUserIsLockout()==1) {
			loginReponse.setMessage("用户被锁定");
			loginReponse.setSuccess(false);
		}else {
			ServletRequestAttributes attrs =(ServletRequestAttributes) RequestContextHolder.getRequestAttributes(); 
			attrs.getRequest().getSession().setAttribute("user",selectUserByuserName);
			loginReponse.setMessage("登陆成功");
			loginReponse.setSuccess(true);
		}
		return loginReponse;
	}

	
}
