package com.ysd.dao.wxx;

import java.util.List;

import com.ysd.entity.wxx.Fenye;
import com.ysd.entity.wxx.Students;

public interface StudentsMapper {
	/**
	 * 多条件查询
	 * @param fenye
	 * @return
	 */
	List<Students> selectAllStudents(Fenye fenye);
	/**
	 * 多条件分页查询
	 * @param fenye
	 * @return
	 */
	Integer selectCountStudents(Fenye fenye);
	/**
	 * 添加
	 * @param fenye
	 * @return
	 */
	Integer insertCountStudents(Students students);
	/**
	 * 编辑
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
