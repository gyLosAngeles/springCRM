package com.ysd.controller.hpy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.hpy.CustomerStudents;
import com.ysd.entity.hpy.Fenye;
import com.ysd.entity.hpy.Netfollows;
import com.ysd.service.hpy.StudentsServiceImp;
@Controller
public class StudentsController {
	
	@Autowired
	private StudentsServiceImp studentsServiceImp;
	
	
	@RequestMapping(value="/selectStu",method=RequestMethod.POST)
	@ResponseBody
	public Fenye selectStu(Fenye fenye,Integer page,Integer rows,String	Name,String	Phone,
			String IsPay,Integer IsValid,String QQ,String IsReturnVist, String	minHomeTime,String	maxHomeTime,String	minPayTime,
		 String	maxPayTime, String	minInClassTime, String	maxInClassTime,String	minFirstVisitTime,String	maxFirstVisitTime,String	minCreateTime,String	maxCreateTime) {
		fenye.setPage((page-1)*rows);
		fenye.setPagesize(rows);
		fenye.setIsPay(IsPay);
		fenye.setIsReturnVist(IsReturnVist);
		fenye.setQQ(QQ);
		fenye.setIsValid(IsValid);
		fenye.setPhone(Phone);
		fenye.setName(Name);
		fenye.setMaxCreateTime(maxCreateTime);
		fenye.setMaxHomeTime(maxHomeTime);
		fenye.setMaxFirstVisitTime(maxFirstVisitTime);
		fenye.setMaxInClassTime(maxInClassTime);
		fenye.setMaxPayTime(maxPayTime);
		fenye.setMinCreateTime(minCreateTime);
		fenye.setMinFirstVisitTime(minFirstVisitTime);
		fenye.setMinInClassTime(minInClassTime);
		fenye.setMinCreateTime(minCreateTime);
		fenye.setMinPayTime(minPayTime);
		fenye=studentsServiceImp.selectStu(fenye);
		return fenye;
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
