package com.ysd.dao.zmf;

import java.util.List;

import com.ysd.entity.Askers;
import com.ysd.entity.Fenye;
import com.ysd.entity.UserChecks;

 
public interface UserChecksMapper {

	/**
	 * ��������ѯǩ��Ա��
	 * @param fenye
	 * @return
	 */
	List<UserChecks> selectUserChecksByFenye(Fenye fenye);
	/**
	 * ��ѯ����Ա��
	 * @param fenye
	 * @return
	 */
	int selectUserChecksCountByFenye(Fenye fenye);
	/**
	 * �޸�yuan
	 * @param userChecks
	 * @return
	 */
	int updateUserChecks(UserChecks userChecks);
	/**
	 * �����Ҫǩ����Ա��
	 * @param userChecks
	 * @return
	 */
	int inserUserChecks(UserChecks userChecks);
	/**
	 * ��ѯ���е���ѯʦ
	 * @return
	 */
	List<Askers> selectAskersAll();
	/**
	 * �޸���ѯʦ��Ȩ�غͱ�ע
	 * @param askers
	 * @return
	 */
	int updateAskers(Askers askers);
	/**
	 * ��ѯ�û���ǩ��״̬
	 * @param userName
	 * @return
	 */
	int selectCheckStateByUserName(String userName);
}
