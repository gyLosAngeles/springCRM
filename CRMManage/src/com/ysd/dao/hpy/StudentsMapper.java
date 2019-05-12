package com.ysd.dao.hpy;

import java.util.List;

import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Fenye;

public interface StudentsMapper {
	List<CustomerStudents> selectStu(Fenye fenye);
	Integer selectCountStu(Fenye fenye);
}
