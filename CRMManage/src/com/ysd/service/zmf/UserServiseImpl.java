package com.ysd.service.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.wxx.AskersMapper;
import com.ysd.dao.zmf.RoleUserMapper;
import com.ysd.dao.zmf.UserTabMapper;
import com.ysd.entity.Askers;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.RoleTab;
import com.ysd.entity.UserRoleTab;
import com.ysd.entity.UserTab;
@Service
public class UserServiseImpl implements UserServise {

	@Autowired
	private UserTabMapper userTabMapper;
	@Autowired
	private RoleUserMapper roleUserMapper;
	@Autowired
	private AskersMapper askersMapper;
	@Autowired
	private Askers  askers;
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
			return  userTabMapper.insertUser(userTab);
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
		UserTab selectUserByuserId = userTabMapper.selectUserByuserId(userRoleTab.getUserId());
		
		if(userRoleTab.getRoleId()>1&&userRoleTab.getRoleId()<5) {
			if(askersMapper.selectCountByaskersName(selectUserByuserId.getUserName())>0) {
				return 0;
			} 
			askers.setRoleName(String.format("%s", (userRoleTab.getRoleId()-1)));
			askers.setAskerName(selectUserByuserId.getUserName());
			askersMapper.insertAskers(askers);
		}
		return roleUserMapper.insertUserRole(userRoleTab);
	}
	public int deleteUserRole(UserRoleTab userRoleTab) {
		if(userRoleTab.getRoleId()>1&&userRoleTab.getRoleId()<5) {
			UserTab selectUserByuserId = userTabMapper.selectUserByuserId(userRoleTab.getUserId());
			askersMapper.deleteAskers(selectUserByuserId.getUserName());
		}
		return roleUserMapper.deleteUserRole(userRoleTab);
	}

}
