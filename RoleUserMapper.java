package com.ysd.dao.zmf;

import java.util.List;

import com.ysd.entity.RoleTab;
import com.ysd.entity.UserRoleTab;

public interface RoleUserMapper {

	/**
	 * ��ѯ���еĽ�ɫ��Ϣ
	 * @return
	 */
	List<RoleTab> selectAllRole();
	/**
	 * ��ѯ�û���Ӧ��
	 * @param userId
	 * @return
	 */
	List<RoleTab> selectRoleByUserId(Integer userId);
	/**
	 * ����û�����Ӧ�Ľ�ɫ
	 * @param userRoleTab
	 * @return
	 */
	int insertUserRole(UserRoleTab userRoleTab);
	/**
	 * ɾ���û�����Ӧ�Ľ�ɫ
	 * @param userRoleTab
	 * @return
	 */
	int deleteUserRole(UserRoleTab userRoleTab);
}

