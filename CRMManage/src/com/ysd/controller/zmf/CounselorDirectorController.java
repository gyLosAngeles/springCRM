package com.ysd.controller.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Askers;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.UserChecks;
import com.ysd.entity.zmf.UserChecksCondition;
import com.ysd.service.zmf.DirectorService;

@Controller
public class CounselorDirectorController {//×ÉÑ¯Ê¦¾­Àí

	@Autowired
	private DirectorService directorService;
	@ResponseBody
	@RequestMapping(value="directorSignInSelect",method=RequestMethod.POST)
	public DataGridData employeeSignIn(Fenye fenye,UserChecksCondition userChecksCondition){
		fenye.setUserChecksCondition(userChecksCondition);
		return directorService.selectSignIn(fenye);	
	}
	@ResponseBody
	@RequestMapping(value="directorSignInUpdate",method=RequestMethod.POST)
	public int employeeCheck(UserChecks userChecks) {
		return directorService.updateSignIn(userChecks);
	}
	@ResponseBody
	@RequestMapping(value="directorUpdate",method=RequestMethod.POST)
	public List<Askers> employeeSignIn(Fenye fenye){
		return null;	
	}
	
}
