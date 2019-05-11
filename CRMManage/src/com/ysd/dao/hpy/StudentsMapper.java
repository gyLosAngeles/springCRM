package com.ysd.dao.hpy;

import java.util.List;

import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Fenye;

public interface StudentsMapper {
	List<CustomerStudents> selectStu(Fenye<CustomerStudents> fenye);
	Integer selectCountStu(Fenye<CustomerStudents> fenye);
}
