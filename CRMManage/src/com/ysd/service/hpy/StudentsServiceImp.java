package com.ysd.service.hpy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.hpy.StudentsMapper;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Fenye;
@Service
public class StudentsServiceImp implements StudentsService {
	@Autowired
	private StudentsMapper studentsMapper;
	public Fenye selectStu(Fenye fenye) {
		List<CustomerStudents> selectStu=studentsMapper.selectStu(fenye);
		Integer selectCountStu=studentsMapper.selectCountStu(fenye);
		System.out.println(selectStu);
		fenye.setRows(selectStu);
		fenye.setTotal(selectCountStu);
		return fenye;
	}
	@Override
	public Integer UpdateStu(CustomerStudents customerStudents) {
		return studentsMapper.UpdateStu(customerStudents);
	}

}
