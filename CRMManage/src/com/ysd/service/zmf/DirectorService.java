package com.ysd.service.zmf;


import java.util.List;

import com.ysd.entity.Askers;
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
	/**
	 * ��ѯ������ѯʦ
	 * @return
	 */
	public List<Askers> selectAskersAll();

	/**
	 * �޸Ķ�Ӧ��ѯʦ��Ȩ��
	 * @param askers
	 * @return
	 */
	public int updateAskersByAskerId(Askers askers);
	/**
	 * ��ѯ�û���ǩ��״̬
	 * @param userName
	 * @return
	 */
	public int selectUserCheckStateByUserName(String userName);
}
