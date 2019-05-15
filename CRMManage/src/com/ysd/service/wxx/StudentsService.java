package com.ysd.service.wxx;

import com.ysd.entity.wxx.Fenye;
import com.ysd.entity.wxx.Students;

public interface StudentsService {
	//多条件查询
 Fenye selectAllStudentsService(Fenye fenye);
//添加
	Integer insertCountStudents(Students students);
	 /** 编辑
	 * @param students
	 * @return
	 */
	Integer updateStudents(Students students);
	/**
	 * 删除
	 * @param i
	 * @return
	 */
	Integer deleteStudents(Integer i);
	
}
