package com.ysd.dao.zmf;



import java.util.List;

import com.ysd.entity.RoleModuleTab;
import com.ysd.entity.RoleTab;

public interface RoleMapper {
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
	  * 添加权限
	  * @param roleModuleTab
	  * @return
	  */
	int insertRoleModule(RoleModuleTab roleModuleTab);
	/**
	 * 移除权限
	 * @param roleModuleTab
	 * @return
	 */
	int deleteRoleModule(RoleModuleTab roleModuleTab);
	/**
	 * 查询角色对应的所有的模块编号
	 * @param roleId
	 * @return
	 */
	List<String> selectModuleIdByRoleId(Integer roleId);
}
