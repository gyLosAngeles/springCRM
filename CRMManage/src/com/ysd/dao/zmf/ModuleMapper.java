package com.ysd.dao.zmf;

import java.util.List;

import com.ysd.entity.ModuleTab;
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
	/**
	 * 添加模块
	 * @param moduleTab
	 * @return
	 */
	int insertModule(ModuleTab moduleTab);
	/**
	 * 删除模块
	 * @param moduleTab
	 * @return
	 */
	int deleteModule(ModuleTab moduleTab);
	/**
	 * 修改模块
	 * @param moduleTab
	 * @return
	 */
	int updateModule(ModuleTab moduleTab);
	/**
	 * 查询用户对应的所有模块
	 * @param userId
	 * @return
	 */
	List<ModuleTree> selectModuleByUserId(Integer userId);
	/**
	 * 查询模块对应的角色数量
	 * @param moduleId
	 * @return
	 */
	Integer selectRoleModuleCount(Integer moduleId);
	
}
