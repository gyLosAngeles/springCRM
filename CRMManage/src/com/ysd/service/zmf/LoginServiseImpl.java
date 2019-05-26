package com.ysd.service.zmf;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ysd.dao.zmf.UserTabMapper;
import com.ysd.entity.UserTab;
import com.ysd.entity.zmf.LoginReponse;
import com.ysd.util.MD5;
@Service
public class LoginServiseImpl implements LoginServise {

	@Autowired
	private UserTabMapper userTabMapper;
	@Autowired
	private LoginReponse loginReponse;
	@Autowired
	private MD5 md5;
	public LoginReponse login(String userName, String userPassWord, HttpServletRequest request,String kaptcha,HttpServletResponse response) {
		UserTab selectUserByuserName = userTabMapper.selectUserByuserName(userName);
		ServletRequestAttributes attrs =(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		UserTab userTab = new UserTab();
		HttpSession session = request.getSession();
		String code = (String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		Cookie[] cookies = request.getCookies();
		if(selectUserByuserName!=null) {
			for (Cookie cookie : cookies) {
				if(cookie.getValue().equals(selectUserByuserName.getUserName())) {
					loginReponse.setMessage("登陆成功");
					loginReponse.setSuccess(true);
					attrs.getRequest().getSession().setAttribute("user",selectUserByuserName);
					userTab.setUserLastLoginTime("time");
					userTab.setUserName(selectUserByuserName.getUserName());
					userTabMapper.updateUser(userTab);
					return loginReponse;
				}
			}
			if(!code.equals(kaptcha)) {
				loginReponse.setMessage("验证码错误");
				loginReponse.setSuccess(false);
			}else if(!selectUserByuserName.getUserPassWord().equals(md5.MD5jia(userPassWord))) {
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
				Cookie cookie = new Cookie("username",selectUserByuserName.getUserName());
				cookie.setMaxAge(30*3600);
				cookie.setPath("/");
				List<Integer> selectRoleIdByuserName = userTabMapper.selectRoleIdByuserName(selectUserByuserName.getUserId());
				for (int i = 0; i < selectRoleIdByuserName.size(); i++) {
					if(selectRoleIdByuserName.get(i)>1&&selectRoleIdByuserName.get(i)<5) {
						attrs.getRequest().getSession().setAttribute("role",selectRoleIdByuserName.get(i)-1);
					}
				}
				attrs.getRequest().getSession().setAttribute("user",selectUserByuserName);
				response.addCookie(cookie);
				loginReponse.setMessage("登陆成功");
				loginReponse.setSuccess(true);
				userTab.setUserLastLoginTime("time");
				userTab.setUserName(selectUserByuserName.getUserName());
				userTabMapper.updateUser(userTab);
			}
		}else{
			loginReponse.setMessage("用户名不存在");
			loginReponse.setSuccess(false);
		}
		
		return loginReponse;
	}


	/**
	 * 修改密码
	 */
	public Integer updateUserMima(String pwd,String newpwd,String userName) {
		UserTab selectUserUserTab = userTabMapper.selectUserUserTab(userName);
		System.out.println(selectUserUserTab.getUserPassWord());
		if(selectUserUserTab !=null && (md5.MD5jia(pwd)).equals(selectUserUserTab.getUserPassWord())) {
			UserTab userTab = new UserTab();
			userTab.setUserName(userName);
			userTab.setUserPassWord(md5.MD5jia(newpwd));
			return userTabMapper.updateUserMima(userTab);
		}
		return 0;
	}

	
}
