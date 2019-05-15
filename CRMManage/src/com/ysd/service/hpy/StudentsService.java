package com.ysd.service.hpy;


import java.util.List;

import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Fenye;
import com.ysd.entity.hpy.Netfollows;
public interface StudentsService {
	Fenye selectStu(Fenye fenye);
	Integer UpdateStu(CustomerStudents customerStudents);
	Integer insertNetfollows(Netfollows netfollows);
	List<Netfollows> selectNetfollows(Netfollows netfollows);
}
