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
	public List<Netfollows> selectNetfollows(Netfollows netfollows) {
		return studentMapper.selectNetfollows(netfollows);
	}

}
