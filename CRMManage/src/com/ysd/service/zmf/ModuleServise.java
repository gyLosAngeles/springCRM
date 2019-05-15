package com.ysd.service.zmf;

import java.util.List;

import com.ysd.entity.ModuleTab;
import com.ysd.entity.zmf.ModuleTree;

public interface ModuleServise {

	/**
	 * ��ѯ���е�ģ��
	 * @return
	 */
	List<ModuleTree> selectModuleAll();
	/**
	 * ׷�ӽڵ�
	 * @param moduleTab
	 * @return
	 */
	int addtModule(ModuleTab moduleTab);
	/**
	 * �Ƴ��ڵ�
	 * @param moduleTab
	 * @return
	 */
	int removeModule(ModuleTab moduleTab);
	/**
	 * �޸Ľڵ�
	 * @param moduleTab
	 * @return
	 */
	int updateModule(ModuleTab moduleTab);
}
