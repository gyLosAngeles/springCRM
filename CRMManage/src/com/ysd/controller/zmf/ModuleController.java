package com.ysd.controller.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.ModuleTab;
import com.ysd.entity.zmf.ModuleTree;
import com.ysd.service.zmf.ModuleServise;

@Controller
public class ModuleController {

	@Autowired
	private ModuleServise moduleServise; 
	
	@ResponseBody
	@RequestMapping(value="moduleSelectAll",method=RequestMethod.POST)
	public List<ModuleTree> selectModule() {
		return  moduleServise.selectModuleAll();
	}
	@ResponseBody
	@RequestMapping(value="moduleAdd",method=RequestMethod.POST)
	public int addModule(ModuleTab moduleTab) {
		return  moduleServise.addtModule(moduleTab);
	}
	@ResponseBody
	@RequestMapping(value="moduleRemove",method=RequestMethod.POST)
	public int removeModule(ModuleTab moduleTab) {
		return  moduleServise.removeModule(moduleTab);
	}
	@ResponseBody
	@RequestMapping(value="moduleUpdate",method=RequestMethod.POST)
	public int updateModule(ModuleTab moduleTab) {
		return  moduleServise.updateModule(moduleTab);
	}
}
