package com.ysd.dao.zmf;

import java.util.List;

import com.ysd.entity.RoleTab;
import com.ysd.entity.UserRoleTab;

public interface RoleUserMapper {

	/**
	 * 查询所有的角色信息
	 * @return
	 */
	List<RoleTab> selectAllRole();
	/**
	 * 查询用户对应的
	 * @param userId
	 * @return
	 */
	List<RoleTab> selectRoleByUserId(Integer userId);
	/**
	 * 添加用户所对应的角色
	 * @param userRoleTab
	 * @return
	 */
	int insertUserRole(UserRoleTab userRoleTab);
	/**
	 * 删除用户所对应的角色
	 * @param userRoleTab
	 * @return
	 */
	int deleteUserRole(UserRoleTab userRoleTab);
}

