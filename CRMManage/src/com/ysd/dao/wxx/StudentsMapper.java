package com.ysd.dao.wxx;

import java.util.List;

import com.ysd.entity.wxx.Fenye;
import com.ysd.entity.wxx.Students;

public interface StudentsMapper {
	/**
	 * ��������ѯ
	 * @param fenye
	 * @return
	 */
	List<Students> selectAllStudents(Fenye fenye);
	/**
	 * ��������ҳ��ѯ
	 * @param fenye
	 * @return
	 */
	Integer selectCountStudents(Fenye fenye);
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
}
