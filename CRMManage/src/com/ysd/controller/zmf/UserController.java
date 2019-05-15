package com.ysd.controller.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.RoleTab;
import com.ysd.entity.UserRoleTab;
import com.ysd.entity.UserTab;
import com.ysd.entity.zmf.UserCondition;
import com.ysd.service.zmf.UserServise;

@Controller
public class UserController {

	@Autowired
	private UserServise userServise;
	@ResponseBody
	@RequestMapping(value="userSelect",method=RequestMethod.POST)
	public DataGridData selectUser(Fenye fenye,UserCondition userCondition) {
		fenye.setUserCondition(userCondition);
		return userServise.selectUserByTiaoJian(fenye);
	}
	@ResponseBody
	@RequestMapping(value="userInsert",method=RequestMethod.POST)
	public int insertUser(UserTab userTab) {
		return userServise.insertUser(userTab);
	}
	@ResponseBody
	@RequestMapping(value="userUpdate",method=RequestMethod.POST)
	public int updateUser(UserTab userTab) {
		return userServise.updateUser(userTab);
	}
	@ResponseBody
	@RequestMapping(value="userDelete",method=RequestMethod.POST)
	public int DeleteUser(String userName) {
		return userServise.deleteUser(userName);
	}
	@ResponseBody
	@RequestMapping(value="userIsLockout",method=RequestMethod.POST)
	public int isLockoutUser(UserTab userTab) {
		return userServise.updateUser(userTab);
	}
	@ResponseBody
	@RequestMapping(value="userRefreshPassWord",method=RequestMethod.POST)
	public int refreshPwd(UserTab userTab) {
		userTab.setUserPassWord("ysd123");
		return userServise.updateUser(userTab);
	}
	@ResponseBody
	@RequestMapping(value="UserRoleAllSelect",method=RequestMethod.POST)
	public List<RoleTab> selectRole() {
		return  userServise.selectUserRole();
	}
	@ResponseBody
	@RequestMapping(value="UserRoleSelect",method=RequestMethod.POST)
	public List<RoleTab> selectUserRole(Integer userId) {
		return  userServise.selectUserRoleById(userId);
	}
	@ResponseBody
	@RequestMapping(value="UserRoleDelete",method=RequestMethod.POST)
	public int userRoleDelete(UserRoleTab userRoleTab ) {
		return  userServise.deleteUserRole(userRoleTab);
	}
	@ResponseBody
	@RequestMapping(value="UserRoleInsert",method=RequestMethod.POST)
	public int userRoleInsert(UserRoleTab userRoleTab ) {
		return  userServise.insertUserRole(userRoleTab);
	}
}
