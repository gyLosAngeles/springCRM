package com.ysd.service.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.zmf.RoleUserMapper;
import com.ysd.dao.zmf.UserChecksMapper;
import com.ysd.dao.zmf.UserTabMapper;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.RoleTab;
import com.ysd.entity.UserChecks;
import com.ysd.entity.UserRoleTab;
import com.ysd.entity.UserTab;
@Service
public class UserServiseImpl implements UserServise {

	@Autowired
	private UserTabMapper userTabMapper;
	@Autowired
	private RoleUserMapper roleUserMapper;
	@Autowired
	private UserChecksMapper userChecksMapper;
	@Autowired
	private UserChecks userChecks;
	@Autowired
	private DataGridData dataGridData;
	public DataGridData selectUserByTiaoJian(Fenye fenye) {
		dataGridData.setRows(userTabMapper.selectUserByTiaoJian(fenye));
		dataGridData.setTotal(userTabMapper.selectUserCountByTiaoJian(fenye));
		return dataGridData;
	}
	public int insertUser(UserTab userTab) {
		UserTab selectUserByuserName = userTabMapper.selectUserByuserName(userTab.getUserName());
		if(selectUserByuserName==null) {
			if(userTabMapper.insertUser(userTab)>0) {
				userChecks.setUserId(userTab.getUserId());
				userChecks.setUserName(userTab.getUserName());
				System.out.println(userTab);
				System.out.println(userChecks);
				return userChecksMapper.inserUserChecks(userChecks);
			}
		}
		return 0;
	}

	public int updateUser(UserTab userTab) {
		return userTabMapper.updateUser(userTab);
	}

	public int deleteUser(String userName) {
		return userTabMapper.deleteUser(userName);
	}

	public List<RoleTab> selectUserRole() {
		return roleUserMapper.selectAllRole();
	}

	public List<RoleTab> selectUserRoleById(Integer userId) {
		return roleUserMapper.selectRoleByUserId(userId);
	}

	public int insertUserRole(UserRoleTab userRoleTab) {
		return roleUserMapper.insertUserRole(userRoleTab);
	}
 
	public int deleteUserRole(UserRoleTab userRoleTab) {
		return roleUserMapper.deleteUserRole(userRoleTab);
	}

}
