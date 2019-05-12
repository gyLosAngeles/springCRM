package com.ysd.controller.hpy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.hpy.Fenye;
import com.ysd.service.hpy.StudentsServiceImp;
@Controller
public class StudentsController {
	
	@Autowired
	private StudentsServiceImp studentsServiceImp;
	
	
	@RequestMapping(value="/selectStu",method=RequestMethod.POST)
	@ResponseBody
	public Fenye selectStu(Fenye fenye,Integer page,Integer rows) {
		System.out.println(page+"fsdfds");
		System.out.println(rows+"fsdfds");
		fenye.setPage((page-1)*rows);
		fenye.setPagesize(rows);
		System.out.println(page);
		System.out.println(rows);
		fenye=studentsServiceImp.selectStu(fenye);
		return fenye;
	}
}
