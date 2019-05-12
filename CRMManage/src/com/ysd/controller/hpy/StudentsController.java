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
	public Fenye selectStu(Fenye fenye,Integer page,Integer rows,String	Name,String	Phone,String IsPay,Integer IsValid,String QQ,String	IsReturnVist) {
		fenye.setPage((page-1)*rows);
		fenye.setPagesize(rows);
		fenye.setIsPay(IsPay);
		fenye.setIsReturnVist(IsReturnVist);
		fenye.setQQ(QQ);
		fenye.setIsValid(IsValid);
		fenye.setPhone(Phone);
		fenye.setName(Name);
		fenye=studentsServiceImp.selectStu(fenye);
		return fenye;
	}
}
