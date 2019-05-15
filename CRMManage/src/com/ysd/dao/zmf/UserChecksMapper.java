package com.ysd.dao.zmf;

import java.util.List;

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
}