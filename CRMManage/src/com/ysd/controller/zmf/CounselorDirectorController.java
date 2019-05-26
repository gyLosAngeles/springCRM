package com.ysd.controller.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Askers;
import com.ysd.entity.DataGridData;
import com.ysd.entity.Fenye;
import com.ysd.entity.wxx.Students;
import com.ysd.entity.zmf.UserChecksCondition;
import com.ysd.service.wxx.StudentsService;
import com.ysd.service.zmf.DirectorService;

@Controller
public class CounselorDirectorController {//咨询师经理

	@Autowired
	private DirectorService directorService;
	@Autowired
	private StudentsService studentsService;
	@ResponseBody
	@RequestMapping(value="directorSignInSelect",method=RequestMethod.POST)
	public DataGridData employeeSignIn(Fenye fenye,UserChecksCondition userChecksCondition){
		fenye.setUserChecksCondition(userChecksCondition);
		return directorService.selectSignIn(fenye);	
	}
	@ResponseBody
	@RequestMapping(value="directorSignInUpdate",method=RequestMethod.POST)
	public int employeeCheck(Askers askers) {//员工签到
		return directorService.updateSignIn(askers);
	}
	@ResponseBody
	@RequestMapping(value="directorAskersSelect",method=RequestMethod.POST)
	public List<Askers> employeeSignIn(){
		return directorService.selectAskersAll();	
	}
	@ResponseBody
	@RequestMapping(value="directorAskersUpdateWidth",method=RequestMethod.POST)
	public int employeeWidth(Askers askers){
		return directorService.updateAskersByAskerId(askers);	
	}
	
	@ResponseBody
	@RequestMapping(value="directorSelectAskers",method=RequestMethod.POST)
	public List<Askers> selectAskers(){
		return directorService.selectAskersByRoleName();	
	}
	@ResponseBody
	@RequestMapping(value="directorUpdateAskers",method=RequestMethod.POST)
	public int updateAskers(Students students,@RequestParam("ids[]") int[] ids){
		return studentsService.updateAskers(students, ids);	
	}
	
	@ResponseBody
	@RequestMapping(value="directorUpdateAskersChangeState",method=RequestMethod.POST)
	public int updateAskers(int changeState){
		return directorService.updateAskerChangeStateByRoleName(changeState);
	}
}
