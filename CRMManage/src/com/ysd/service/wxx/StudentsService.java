package com.ysd.service.wxx;

import java.util.List;

import com.ysd.entity.Askers;
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
	/**
	 * 修改咨询师
	 * @param askers
	 * @return
	 */
	  Integer updateAskers(Askers askers);
	  /**
	   * 查询所有
	   * @param fenye
	   * @return
	   */
	  List<Askers> selectAskers(Askers askers);
}
