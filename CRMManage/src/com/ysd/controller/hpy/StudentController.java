package com.ysd.controller.hpy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Askers;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.hpy.ConsultantStuCondition;
import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Netfollows;
import com.ysd.service.hpy.StudentsServiceImp;
@Controller
public class StudentController {
	
	@Autowired
	private StudentsServiceImp studentsServiceImp;
	
	
	@RequestMapping(value="/selectStu",method=RequestMethod.POST)
	@ResponseBody
	public DataGridData selectStu(Fenye fenye,ConsultantStuCondition consultantStuCondition  ) {
		fenye.setConsultantStuCondition(consultantStuCondition);
		return studentsServiceImp.selectStu(fenye);
	}
	@RequestMapping(value="/UpdateStu",method=RequestMethod.POST)
	@ResponseBody
	public Integer UpdateStu(CustomerStudents customerStudents) {
		return studentsServiceImp.UpdateStu(customerStudents);
	}
	@RequestMapping(value="/insertNetfollows",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertNetfollows(Netfollows netfollows) {
		// TODO Auto-generated method stub
		return studentsServiceImp.insertNetfollows(netfollows);
	}
	@RequestMapping(value="/selectNetfollows",method=RequestMethod.POST)
	@ResponseBody
	public List<Netfollows> selectNetfollows(Netfollows netfollows) {
		return studentsServiceImp.selectNetfollows(netfollows);
	}
}
