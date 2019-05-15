package com.ysd.dao.hpy;

import java.util.List;

import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Fenye;
import com.ysd.entity.hpy.Netfollows;

public interface StudentsMapper {
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
	
	List<Netfollows> selectNetfollows(Netfollows netfollows);
}
