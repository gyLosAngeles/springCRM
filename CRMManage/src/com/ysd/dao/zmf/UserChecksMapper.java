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
	 * �޸�ǩ����־���е�״̬
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
	 * ��ѯ������ѯʦ�����ɫ��Ӧ����
	 * @return
	 */
	List<Askers> selectAskersByroleName();
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
	Integer selectCheckStateByUserName(String userName);
	
	
	/**
	 * ��������ѯ��ѯʦǩ��
	 * @param fenye
	 * @return
	 */
	List<Askers> selectAskersChecksByFenye(Fenye fenye);
	/**
	 * ��������ѯ��ѯʦǩ������
	 * @param fenye
	 * @return
	 */
	int selectAskersChecksCountByFenye(Fenye fenye);
	/**
	 * �޸���ѯʦ������Զ�����
	 * @param askers
	 * @return
	 */
	int udpateDirectorControllerChecks(Askers askers);
	/**
	 * �޸�ǩ��״̬
	 * @param askers
	 * @return
	 */
	int updateAskersCheckState(Askers askers);
	
	/**
	 * �����־��Ϣ
	 * @param userChecks
	 * @return
	 */
	int insertUserChecksNetfollows(UserChecks userChecks);
	/**
	 * ��ǩ�ɹ�ʱ�޸���־�����ǩʱ��
	 * @param userChecks
	 * @return
	 */
	int updateUserChecksNetfollows(UserChecks userChecks);
}
