package com.ysd.service.zmf;

import java.util.List;

import com.ysd.entity.zmf.ModuleTree;

public interface ConservatorServise {

	/**
	 * 根据用户编号查询对应的所有模块
	 * @return
	 */
	List<ModuleTree> selectModuleByRoleId(Integer userId);
	
}
