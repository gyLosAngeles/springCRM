package com.ysd.service.hpy;


import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Fenye;
public interface StudentsService {
	Fenye selectStu(Fenye fenye);
	Integer UpdateStu(CustomerStudents customerStudents);
}
