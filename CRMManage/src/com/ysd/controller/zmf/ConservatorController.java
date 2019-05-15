package com.ysd.controller.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.zmf.ModuleTree;
import com.ysd.service.zmf.ConservatorServise;

 

@Controller//π‹¿Ì‘±
public class ConservatorController {

	@Autowired
	private ConservatorServise conservatorServise;
	@ResponseBody
	@RequestMapping(value="module",method=RequestMethod.GET)
	public List<ModuleTree> selectModule(int userId) {
		return conservatorServise.selectModuleByRoleId(userId);
	}
}
