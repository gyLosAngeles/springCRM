package com.ysd.service.zmf;

import java.util.List;

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
			List<Integer> selectRoleIdByuserName = userTabMapper.selectRoleIdByuserName(selectUserByuserName.getUserId());
			ServletRequestAttributes attrs =(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
			for (int i = 0; i < selectRoleIdByuserName.size(); i++) {
				if(selectRoleIdByuserName.get(i)>1&&selectRoleIdByuserName.get(i)<5) {
					attrs.getRequest().getSession().setAttribute("role",selectRoleIdByuserName.get(i)-1);
				}
			}
			attrs.getRequest().getSession().setAttribute("user",selectUserByuserName);
			loginReponse.setMessage("登陆成功");
			loginReponse.setSuccess(true);
		}
		return loginReponse;
	}

	/**
	 * 	查询用户
	 */
	@Override
	public UserTab selectUserUserTab(Integer userId) {
		// TODO Auto-generated method stub
		return userTabMapper.selectUserUserTab(userId);
	}

	/**
	 * 修改密码
	 */
	@Override
	public Integer updateUserMima(UserTab userTab) {
		// TODO Auto-generated method stub
		return userTabMapper.updateUserMima(userTab);
	}

	
}
