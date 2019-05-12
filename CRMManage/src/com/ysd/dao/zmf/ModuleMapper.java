package com.ysd.dao.zmf;

import java.util.List;

import com.ysd.entity.zmf.ModuleTree;

public interface ModuleMapper {

	/**
	 * 根据角色编号查询对应的模块
	 * @param roleId
	 * @return
	 */
	List<ModuleTree> selectModuleByRoleId(Integer roleId);
	/**
	 * 查询所有的模块
	 * @return
	 */
	List<ModuleTree> selectAllModuble();
}
