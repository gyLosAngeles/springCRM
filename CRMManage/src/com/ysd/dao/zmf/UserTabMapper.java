package com.ysd.dao.zmf;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.UserTab;

public interface UserTabMapper {

	/**
	 *������ ��ѯ�û�
	 * @param fenye
	 * @return
	 */
	List<UserTab> selectUserByTiaoJian(Fenye fenye);

	/**
	 * ��ѯ������
	 * @param fenye
	 * @return
	 */
	int selectUserCountByTiaoJian(Fenye fenye);
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
	 * �����û�����ѯ
	 * @param userName
	 * @return
	 */
	UserTab selectUserByuserName(String userName);
	/**
	 * ���ݱ�Ų�ѯ����
	 * @param id
	 * @return
	 */
	UserTab selectUserByuserId(Integer id);
	
	
	/**
	 * 		����id��ѯ�û��Ƿ����
	 * @param userTab
	 * @return
	 */
	UserTab	selectUserUserTab(Integer userId);
	
	/**
	 *    	�޸�����
	 * @param userTab
	 * @return
	 */
	Integer updateUserMima(UserTab userTab);
	/**
	 * �����û�����ѯ��Ӧ�Ľ�ɫ���
	 * @param userName
	 * @return
	 */
	List<Integer> selectRoleIdByuserName(Integer id);
}
