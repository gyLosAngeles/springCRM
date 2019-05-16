package com.ysd.dao.hpy;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;

public interface StudentMapper {
	/**
	 *  ��ѯ������ѯʦ��Ӧѧ����Ϣ
	 * @param fenye
	 * @return
	 */
	List<CustomerStudents> selectStu(Fenye fenye);
	/**
	 * ��ѯ������ѯʦ��Ӧѧ����Ϣ������
	 * @param fenye
	 * @return
	 */
	Integer selectCountStu(Fenye fenye);
	/**
	 * ��ѧ����Ϣ���и���
	 * @param customerStudents
	 * @return
	 */
	Integer UpdateStu(CustomerStudents customerStudents);
	/**
	 * ��ѧ�����и���
	 * @param netfollows
	 * @return
	 */
	Integer insertNetfollows(Netfollows netfollows);
	
	List<CustomerStudents> selectNetfollows(Fenye fenye);
	
	Integer selectCountNet(Fenye fenye);
}
