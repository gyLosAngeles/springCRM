package com.ysd.service.hpy;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.hpy.StudentMapper;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;
@Service
public class StudentsServiceImp implements StudentsService {
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private DataGridData dataGridData;
	public DataGridData selectStu(Fenye fenye) {
		fenye.getConsultantStuCondition().getAskerId();
		dataGridData.setRows(studentMapper.selectStu(fenye));
		dataGridData.setTotal(studentMapper.selectCountStu(fenye));
		return dataGridData;
	}
	public Integer UpdateStu(CustomerStudents customerStudents) {
		return studentMapper.UpdateStu(customerStudents);
	}
	public Integer insertNetfollows(Netfollows netfollows) {
		return studentMapper.insertNetfollows(netfollows);
	}
	public DataGridData selectNetfollows(Fenye fenye) {
		dataGridData.setRows(studentMapper.selectNetfollows(fenye));
		dataGridData.setTotal(studentMapper.selectCountNet(fenye));
		return dataGridData;
	}
	@Override
	public DataGridData selectStuAsker(Fenye fenye) {
		fenye.getConsultantStuCondition().getAskerId();
		dataGridData.setRows(studentMapper.selectStuAsker(fenye));
		dataGridData.setTotal(studentMapper.selectCountStuAsker(fenye));
		return dataGridData;
	}
	public List<Netfollows> selectNetfollowsID(Netfollows netfollows) {
		// TODO Auto-generated method stub
		return studentMapper.selectNetfollowsID(netfollows);
	}
}
