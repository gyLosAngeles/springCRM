package com.ysd.dao.zmf;



import java.util.List;

import com.ysd.entity.RoleModuleTab;
import com.ysd.entity.RoleTab;

public interface RoleMapper {
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
	  * ���Ȩ��
	  * @param roleModuleTab
	  * @return
	  */
	int insertRoleModule(RoleModuleTab roleModuleTab);
	/**
	 * �Ƴ�Ȩ��
	 * @param roleModuleTab
	 * @return
	 */
	int deleteRoleModule(RoleModuleTab roleModuleTab);
	/**
	 * ��ѯ��ɫ��Ӧ�����е�ģ����
	 * @param roleId
	 * @return
	 */
	List<String> selectModuleIdByRoleId(Integer roleId);
}
