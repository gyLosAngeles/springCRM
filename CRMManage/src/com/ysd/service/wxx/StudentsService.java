package com.ysd.service.wxx;

import com.ysd.entity.wxx.Fenye;
import com.ysd.entity.wxx.Students;

public interface StudentsService {
	//��������ѯ
 Fenye selectAllStudentsService(Fenye fenye);
//���
	Integer insertCountStudents(Students students);
	 /** �༭
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
