package com.ysd.service.wxx;

import java.util.List;

import com.ysd.entity.Askers;
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
	/**
	 * �޸���ѯʦ
	 * @param askers
	 * @return
	 */
	  Integer updateAskers(Askers askers);
	  /**
	   * ��ѯ����
	   * @param fenye
	   * @return
	   */
	  List<Askers> selectAskers(Askers askers);
}
