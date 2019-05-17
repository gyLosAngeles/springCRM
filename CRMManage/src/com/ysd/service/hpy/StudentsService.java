package com.ysd.service.hpy;

import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;
public interface StudentsService {
	DataGridData selectStu(Fenye fenye);
	Integer UpdateStu(CustomerStudents customerStudents);
	Integer insertNetfollows(Netfollows netfollows);
	DataGridData selectNetfollows(Fenye fenye);
}
