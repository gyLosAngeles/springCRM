package com.ysd.service.zmf;


import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.UserChecks;

public interface DirectorService {
	/**
	 * ǩ����ѯ
	 * @return
	 */
	DataGridData selectSignIn(Fenye fenye);
	/**
	 * ǩ��
	 * @param userChecks
	 * @return
	 */
	int updateSignIn(UserChecks userChecks);
}
