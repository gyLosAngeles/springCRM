package com.ysd.service.zmf;

import java.util.List;

import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.RoleTab;
import com.ysd.entity.UserRoleTab;
import com.ysd.entity.UserTab;

public interface UserServise {

	/**
	 * 多条件查询用户
	 * @param fenye
	 * @return
	 */
	DataGridData selectUserByTiaoJian(Fenye fenye);
	/**
	 * 添加用户
	 * @param userTab
	 * @return
	 */
	int insertUser(UserTab userTab);

	/**
	 * 修改用户
	 * @param userTab
	 * @return
	 */
	int updateUser(UserTab userTab);
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	int deleteUser(String userName);
	/**
	 * 查询所有的角色
	 * @return
	 */
	List<RoleTab> selectUserRole();
	/**
	 * 根据用户编号查询角色
	 * @param userId
	 * @return
	 */
	List<RoleTab> selectUserRoleById(Integer userId);
	/**
	 * 为用户设置角色
	 * @param userRoleTab
	 * @return
	 */
	int insertUserRole(UserRoleTab userRoleTab);
	/**
	 * 移除用户设置的角色
	 * @param userRoleTab
	 * @return
	 */
	int deleteUserRole(UserRoleTab userRoleTab);
}
