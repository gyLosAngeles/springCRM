package com.ysd.service.zmf;

import java.util.List;

import com.ysd.entity.ModuleTab;
import com.ysd.entity.zmf.ModuleTree;

public interface ModuleServise {

	/**
	 * 查询所有的模块
	 * @return
	 */
	List<ModuleTree> selectModuleAll();
	/**
	 * 追加节点
	 * @param moduleTab
	 * @return
	 */
	int addtModule(ModuleTab moduleTab);
	/**
	 * 移除节点
	 * @param moduleTab
	 * @return
	 */
	int removeModule(ModuleTab moduleTab);
	/**
	 * 修改节点
	 * @param moduleTab
	 * @return
	 */
	int updateModule(ModuleTab moduleTab);
}
