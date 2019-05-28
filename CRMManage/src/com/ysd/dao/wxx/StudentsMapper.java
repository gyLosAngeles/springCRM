package com.ysd.dao.wxx;

import java.util.List;

import com.ysd.entity.Push;
import com.ysd.entity.wxx.Fenye;
import com.ysd.entity.wxx.Students;

public interface StudentsMapper {
	/**
	 *咨询师经理查询全部
	 * @param fenye
	 * @return
	 */
	List<Students> selectAllStudents(Fenye fenye);
	/**
	 * 咨询师经理查询全部数量
	 * @param fenye
	 * @return
	 */
	Integer selectCountStudents(Fenye fenye);
	
	/**
	 * 网络咨询师查询自己
	 * @param fenye
	 * @return
	 */
	List<Students> selectStudentsByroleName(Fenye fenye);
	/**
	 *  网络咨询师查询自己数量
	 * @param fenye
	 * @return
	 */
	Integer selectCountStudentsByroleName(Fenye fenye);
	
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
	/**
	 * 推送添加
	 * @param push
	 * @return
	 */
	Integer addPush(Push push);
}
