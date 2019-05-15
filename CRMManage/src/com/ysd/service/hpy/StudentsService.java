package com.ysd.service.hpy;


import java.util.List;

import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;
public interface StudentsService {
	DataGridData selectStu(Fenye fenye);
	Integer UpdateStu(CustomerStudents customerStudents);
	Integer insertNetfollows(Netfollows netfollows);
	List<Netfollows> selectNetfollows(Netfollows netfollows);
}
