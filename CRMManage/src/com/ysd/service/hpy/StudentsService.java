package com.ysd.service.hpy;


import java.util.List;

import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.Push;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;
public interface StudentsService {
	/*
	 * 修改学生信息
	 */
	Integer UpdateStu(CustomerStudents customerStudents);
	/*
	 * 添加学生跟踪信息
	 */
	Integer insertNetfollows(Netfollows netfollows);
	/*
	 * 查询全部跟踪信息
	 */
	DataGridData selectNetfollows(Fenye fenye);
	/*
	 * 根据当前登录咨询师获取对应的学生信息
	 */
	DataGridData selectStuAsker(Fenye fenye);
	/*
	 * 根据学生id查询对应的跟踪信息
	 */
	List<Netfollows> selectNetfollowsID(Netfollows netfollows);
	/*
	 * 查询全部推送信息
	 */
	List<Push> selectPush(Push push);
	/*
	 * 修改推送信息已读未读状态
	 */
	Integer UpdatePush(Push push);
}
