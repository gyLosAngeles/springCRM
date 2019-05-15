package com.ysd.controller.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.RoleModuleTab;
import com.ysd.entity.RoleTab;
import com.ysd.entity.zmf.ModuleTree;
import com.ysd.service.zmf.RoleServise;
import com.ysd.service.zmf.UserServise;

@Controller
public class RoleController {

	@Autowired
	private UserServise userServise;
	@Autowired
	private RoleServise roleServise;
	@ResponseBody
	@RequestMapping(value="RoleAllSelect",method=RequestMethod.POST)
	public List<RoleTab> selectRole() {
		return  userServise.selectUserRole();
	}
	@ResponseBody
	@RequestMapping(value="Roleinsert",method=RequestMethod.POST)
	public int roleinsert(String roleName) {
		return  roleServise.insertRole(roleName);
	}
	@ResponseBody
	@RequestMapping(value="Roledelete",method=RequestMethod.POST)
	public int Roledelete(int roleId) {
		return  roleServise.deleteRole(roleId);
	}
	@ResponseBody
	@RequestMapping(value="Roleupdate",method=RequestMethod.POST)
	public int roleupdate(RoleTab roleTab) {
		return  roleServise.updateRole(roleTab);
	}
	@ResponseBody
	@RequestMapping(value="RoleModuleSelect",method=RequestMethod.POST)
	public List<ModuleTree> selectRoleModule(RoleModuleTab roleModuleTab){
		return roleServise.selectRoleModule(roleModuleTab);
	}
	@ResponseBody
	@RequestMapping(value="RoleModuleSet",method=RequestMethod.POST)
	public int roleSetModule(String Modules,int roleId) {
		return roleServise.updateRoleModule(Modules, roleId);
	}
}
