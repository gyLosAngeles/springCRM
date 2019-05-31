package com.ysd.service.hpy;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.hpy.StudentMapper;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.Push;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;
@Service
public class StudentsServiceImp implements StudentsService {
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private DataGridData dataGridData;
	/*
	 * 修改学生信息
	 */
	public Integer UpdateStu(CustomerStudents customerStudents) {
		return studentMapper.UpdateStu(customerStudents);
	}
	/*
	 * 添加学生跟踪信息
	 */
	public Integer insertNetfollows(Netfollows netfollows) {
		return studentMapper.insertNetfollows(netfollows);
	}
	/*
	 * 分页查询学生跟踪信息
	 */
	public DataGridData selectNetfollows(Fenye fenye) {
		dataGridData.setRows(studentMapper.selectNetfollows(fenye));
		dataGridData.setTotal(studentMapper.selectCountNet(fenye));
		return dataGridData;
	}
	/*
	 * 根据咨询师名字分页多条件查询对应的学生信息
	 */
	public DataGridData selectStuAsker(Fenye fenye) {
		fenye.getConsultantStuCondition().getAskerId();
		dataGridData.setRows(studentMapper.selectStuAsker(fenye));
		dataGridData.setTotal(studentMapper.selectCountStuAsker(fenye));
		return dataGridData;
	}
	/*
	 * 根据学生id查询对应学生的全部跟踪信息
	 */
	public List<Netfollows> selectNetfollowsID(Netfollows netfollows) {
		return studentMapper.selectNetfollowsID(netfollows);
	}
	/*
	 * 查询全部推送信息
	 */
	public List<Push> selectPush(Push push) {
		return studentMapper.selectPush(push);
	}
	/*
	 * 修改推送信息状态
	 */
	public Integer UpdatePush(Push push) {
		return studentMapper.UpdatePush(push);
	}
}
