package com.ysd.service.hpy;


import java.util.List;

import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.Push;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;
public interface StudentsService {
	/*
	 * �޸�ѧ����Ϣ
	 */
	Integer UpdateStu(CustomerStudents customerStudents);
	/*
	 * ���ѧ��������Ϣ
	 */
	Integer insertNetfollows(Netfollows netfollows);
	/*
	 * ��ѯȫ��������Ϣ
	 */
	DataGridData selectNetfollows(Fenye fenye);
	/*
	 * ���ݵ�ǰ��¼��ѯʦ��ȡ��Ӧ��ѧ����Ϣ
	 */
	DataGridData selectStuAsker(Fenye fenye);
	/*
	 * ����ѧ��id��ѯ��Ӧ�ĸ�����Ϣ
	 */
	List<Netfollows> selectNetfollowsID(Netfollows netfollows);
	/*
	 * ��ѯȫ��������Ϣ
	 */
	List<Push> selectPush(Push push);
	/*
	 * �޸�������Ϣ�Ѷ�δ��״̬
	 */
	Integer UpdatePush(Push push);
}
