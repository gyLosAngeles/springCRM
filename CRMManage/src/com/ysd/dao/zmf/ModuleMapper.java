package com.ysd.dao.zmf;

import java.util.List;

import com.ysd.entity.zmf.ModuleTree;

public interface ModuleMapper {

	/**
	 * ���ݽ�ɫ��Ų�ѯ��Ӧ��ģ��
	 * @param roleId
	 * @return
	 */
	List<ModuleTree> selectModuleByRoleId(Integer roleId);
	/**
	 * ��ѯ���е�ģ��
	 * @return
	 */
	List<ModuleTree> selectAllModuble();
}
