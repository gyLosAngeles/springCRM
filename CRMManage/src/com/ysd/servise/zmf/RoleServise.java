package com.ysd.servise.zmf;

import java.util.List;

import com.ysd.entity.RoleModuleTab;
import com.ysd.entity.RoleTab;
import com.ysd.entity.zmf.ModuleTree;

public interface RoleServise {

	/**
	 * 添加角色
	 * @param roleName
	 * @return
	 */
	int insertRole(String roleName);
	/**
	 * 修改角色
	 * @param roleTab
	 * @return
	 */
	int updateRole(RoleTab roleTab);
	/**
	 * 删除角色
	 * @param roleId
	 * @return
	 */
	int deleteRole(Integer roleId);
	/**
	 * 设置角色权限
	 * @param roleModuleTab
	 * @return
	 */
	int updateRoleModule(RoleModuleTab roleModuleTab);
	/**
	 * 查询角色对应权限
	 * @param roleModuleTab
	 * @return
	 */
	List<ModuleTree> selectRoleModule(RoleModuleTab roleModuleTab);
}

