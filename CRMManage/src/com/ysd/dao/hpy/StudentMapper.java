package com.ysd.dao.hpy;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Push;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;

public interface StudentMapper {
	/**
	 *  查询所有咨询师对应学生信息
	 * @param fenye
	 * @return
	 */
	List<CustomerStudents> selectStu(Fenye fenye);
	/**
	 * 查询所有咨询师对应学生信息总条数
	 * @param fenye
	 * @return
	 */
	Integer selectCountStu(Fenye fenye);
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
	 * 网络跟踪
	 * @param fenye
	 * @return
	 */
	List<CustomerStudents> selectNetfollows(Fenye fenye);
	
	Integer selectCountNet(Fenye fenye);
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
