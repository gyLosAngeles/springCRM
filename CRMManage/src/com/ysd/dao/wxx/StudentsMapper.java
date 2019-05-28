package com.ysd.dao.wxx;

import java.util.List;

import com.ysd.entity.Push;
import com.ysd.entity.wxx.Fenye;
import com.ysd.entity.wxx.Students;

public interface StudentsMapper {
	/**
	 *��ѯʦ�����ѯȫ��
	 * @param fenye
	 * @return
	 */
	List<Students> selectAllStudents(Fenye fenye);
	/**
	 * ��ѯʦ�����ѯȫ������
	 * @param fenye
	 * @return
	 */
	Integer selectCountStudents(Fenye fenye);
	
	/**
	 * ������ѯʦ��ѯ�Լ�
	 * @param fenye
	 * @return
	 */
	List<Students> selectStudentsByroleName(Fenye fenye);
	/**
	 *  ������ѯʦ��ѯ�Լ�����
	 * @param fenye
	 * @return
	 */
	Integer selectCountStudentsByroleName(Fenye fenye);
	
	/**
	 * ���
	 * @param fenye
	 * @return
	 */
	Integer insertCountStudents(Students students);
	/**
	 * �༭
	 * @param students
	 * @return
	 */
	Integer updateStudents(Students students);
	/**
	 * ɾ��
	 * @param i
	 * @return
	 */
	Integer deleteStudents(Integer i);
	/**
	 * �������
	 * @param push
	 * @return
	 */
	Integer addPush(Push push);
}
