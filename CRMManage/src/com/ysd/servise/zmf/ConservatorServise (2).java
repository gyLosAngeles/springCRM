package com.ysd.servise.zmf;

import java.util.List;

import com.ysd.entity.zmf.ModuleTree;

public interface ConservatorServise {

	/**
	 * ���ݽ�ɫ��Ų�ѯģ��
	 * @return
	 */
	List<ModuleTree> selectModuleByRoleId(Integer roleId);
	
}
