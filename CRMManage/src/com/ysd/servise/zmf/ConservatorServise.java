package com.ysd.servise.zmf;

import java.util.List;

import com.ysd.entity.zmf.ModuleTree;

public interface ConservatorServise {

	/**
	 * 根据角色编号查询模块
	 * @return
	 */
	List<ModuleTree> selectModuleByRoleId(Integer roleId);
	
}
