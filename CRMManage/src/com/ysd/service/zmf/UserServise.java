package com.ysd.service.zmf;

import java.util.List;

import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.RoleTab;
import com.ysd.entity.UserRoleTab;
import com.ysd.entity.UserTab;

public interface UserServise {

	/**
	 * ��������ѯ�û�
	 * @param fenye
	 * @return
	 */
	DataGridData selectUserByTiaoJian(Fenye fenye);
	/**
	 * ����û�
	 * @param userTab
	 * @return
	 */
	int insertUser(UserTab userTab);

	/**
	 * �޸��û�
	 * @param userTab
	 * @return
	 */
	int updateUser(UserTab userTab);
	/**
	 * ɾ���û�
	 * @param userId
	 * @return
	 */
	int deleteUser(String userName);
	/**
	 * ��ѯ���еĽ�ɫ
	 * @return
	 */
	List<RoleTab> selectUserRole();
	/**
	 * �����û���Ų�ѯ��ɫ
	 * @param userId
	 * @return
	 */
	List<RoleTab> selectUserRoleById(Integer userId);
	/**
	 * Ϊ�û����ý�ɫ
	 * @param userRoleTab
	 * @return
	 */
	int insertUserRole(UserRoleTab userRoleTab);
	/**
	 * �Ƴ��û����õĽ�ɫ
	 * @param userRoleTab
	 * @return
	 */
	int deleteUserRole(UserRoleTab userRoleTab);
}
