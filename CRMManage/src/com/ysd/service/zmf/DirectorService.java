package com.ysd.service.zmf;


import java.util.List;

import com.ysd.entity.Askers;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;

public interface DirectorService {
	/**
	 * ǩ����ѯ
	 * @return
	 */
	DataGridData selectSignIn(Fenye fenye);
	/**
	 * ǩ������ǩ
	 * @param userChecks
	 * @return
	 */
	int updateSignIn(Askers askers);
	/**
	 * ��ѯ������ѯ���е�����
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
	/**
	 * ��ѯ���е���ѯʦ
	 * @return
	 */
	List<Askers> selectAskersByRoleName();
	 
	
}
