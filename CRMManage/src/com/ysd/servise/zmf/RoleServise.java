package com.ysd.servise.zmf;

import java.util.List;

import com.ysd.entity.RoleModuleTab;
import com.ysd.entity.RoleTab;
import com.ysd.entity.zmf.ModuleTree;

public interface RoleServise {

	/**
	 * ��ӽ�ɫ
	 * @param roleName
	 * @return
	 */
	int insertRole(String roleName);
	/**
	 * �޸Ľ�ɫ
	 * @param roleTab
	 * @return
	 */
	int updateRole(RoleTab roleTab);
	/**
	 * ɾ����ɫ
	 * @param roleId
	 * @return
	 */
	int deleteRole(Integer roleId);
	/**
	 * ���ý�ɫȨ��
	 * @param roleModuleTab
	 * @return
	 */
	int updateRoleModule(RoleModuleTab roleModuleTab);
	/**
	 * ��ѯ��ɫ��ӦȨ��
	 * @param roleModuleTab
	 * @return
	 */
	List<ModuleTree> selectRoleModule(RoleModuleTab roleModuleTab);
}

