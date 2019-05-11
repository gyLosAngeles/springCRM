package com.ysd.service.hpy;

import org.springframework.stereotype.Service;

import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Fenye;
public interface StudentsService {
	Fenye<CustomerStudents> selectStu(Fenye<CustomerStudents> fenye);
}
