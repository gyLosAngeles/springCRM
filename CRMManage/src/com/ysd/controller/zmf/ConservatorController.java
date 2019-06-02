package com.ysd.controller.zmf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Askers;
import com.ysd.entity.zmf.ModuleTree;
import com.ysd.entity.zmf.PieChart;
import com.ysd.service.zmf.ConservatorServise;
import com.ysd.service.zmf.DirectorService;


 

@Controller//管理员
public class ConservatorController {

	@Autowired
	private ConservatorServise conservatorServise;
	@Autowired
	private DirectorService directorService;
	
	
	@ResponseBody
	@RequestMapping(value="module",method=RequestMethod.GET)
	public List<ModuleTree> selectModule(int userId) {
		return conservatorServise.selectModuleByRoleId(userId);
	}
	@ResponseBody
	@RequestMapping(value="user/userSignIn",method=RequestMethod.POST)
	public int signInUser(Askers askers) {
		return directorService.updateSignIn(askers);
	}
	@ResponseBody
	@RequestMapping(value="user/userSignInCheckState",method=RequestMethod.POST)
	public int signInUserCheckStateselect(String userName) {
		return directorService.selectUserCheckStateByUserName(userName);
	}
	@ResponseBody
	@RequestMapping(value="index/PieChart",method=RequestMethod.POST)
	public List<PieChart> getPieChart() {//返回一个饼状图
		return conservatorServise.selectStudentLearnForward();
	}
	@ResponseBody
	@RequestMapping(value="user/signOut",method=RequestMethod.POST)
	public int signOut(HttpServletRequest request) {
		request.getSession().removeAttribute("role");
		request.getSession().removeAttribute("user");
		return 1;
	}
}
