package com.ysd.service.zmf;

import java.util.List;

import com.ysd.entity.zmf.ModuleTree;

public interface ConservatorServise {

	/**
	 * �����û���Ų�ѯ��Ӧ������ģ��
	 * @return
	 */
	List<ModuleTree> selectModuleByRoleId(Integer userId);
	
}
