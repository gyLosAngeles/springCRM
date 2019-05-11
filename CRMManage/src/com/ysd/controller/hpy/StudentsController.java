package com.ysd.controller.hpy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Fenye;
import com.ysd.service.hpy.StudentsServiceImp;
@Controller
public class StudentsController {
	@Autowired
	private StudentsServiceImp serviceImp;
	@RequestMapping(value="/selectStu",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<CustomerStudents> selectStu(Fenye<CustomerStudents> fenye,Integer page,Integer rows) {
		fenye.setPage((page-1)*rows);
		fenye.setPagesize(rows);
		fenye=serviceImp.selectStu(fenye);
		return fenye;
	}
}
