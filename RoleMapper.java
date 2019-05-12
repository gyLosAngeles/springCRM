package com.ysd.dao.zmf;



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
}
