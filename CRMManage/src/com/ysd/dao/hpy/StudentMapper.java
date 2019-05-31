package com.ysd.dao.hpy;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Push;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;

public interface StudentMapper {
	/**
	 * 对学生信息进行更新
	 * @param customerStudents
	 * @return
	 */
	Integer UpdateStu(CustomerStudents customerStudents);
	/**
	 * 对学生进行跟踪
	 * @param netfollows
	 * @return
	 */
	Integer insertNetfollows(Netfollows netfollows);
	/**
	 *	查询当前登录咨询师的所有学生的跟踪信息
	 * @param fenye
	 * @return
	 */
	List<CustomerStudents> selectNetfollows(Fenye fenye);
	/**
	 * 跟踪信息的总条数
	 * @param fenye
	 * @return
	 */
	Integer selectCountNet(Fenye fenye);
	
	/**
	 *	根据学生id查询对应的跟踪信息
	 * @param fenye
	 * @return
	 */
	List<Netfollows> selectNetfollowsID(Netfollows netfollows);
	/**
	 *  查询所有咨询师对应学生信息
	 * @param fenye
	 * @return
	 */
	List<CustomerStudents> selectStuAsker(Fenye fenye);
	/**
	 * 查询所有咨询师对应学生信息总条数
	 * @param fenye
	 * @return
	 */
	Integer selectCountStuAsker(Fenye fenye);
	/**
	 * 动态显示推送信息
	 * @param push
	 * @return
	 */
	List<Push> selectPush(Push push);
	/**
	 * 把消息标为已读
	 * @param customerStudents
	 * @return
	 */
	Integer UpdatePush(Push push);
}
