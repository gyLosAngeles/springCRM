package com.ysd.service.hpy;


import java.util.List;

import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.Push;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;
public interface StudentsService {
	DataGridData selectStu(Fenye fenye);
	Integer UpdateStu(CustomerStudents customerStudents);
	Integer insertNetfollows(Netfollows netfollows);
	//DataGridData   分页，总条数的封装实体类 
	DataGridData selectNetfollows(Fenye fenye);
	DataGridData selectStuAsker(Fenye fenye);
	List<Netfollows> selectNetfollowsID(Netfollows netfollows);
	List<Push> selectPush(Push push);
	
	Integer UpdatePush(Push push);
}
