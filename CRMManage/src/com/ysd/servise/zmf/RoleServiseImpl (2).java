package com.ysd.servise.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.zmf.ModuleMapper;
import com.ysd.dao.zmf.RoleMapper;
import com.ysd.entity.RoleModuleTab;
import com.ysd.entity.RoleTab;
import com.ysd.entity.zmf.ModuleTree;
import com.ysd.util.TreeNode;

@Service
public class RoleServiseImpl implements RoleServise {

	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private TreeNode treeNode;
	@Autowired
	private ModuleMapper moduleMapper;
	
	public int insertRole(String roleName) {
		return roleMapper.insertRole(roleName);
	}

 
	public int updateRole(RoleTab roleTab) {
		return roleMapper.updateRole(roleTab);
	}

	public int deleteRole(Integer roleId) {
		return roleMapper.deleteRole(roleId);
	}

	public int updateRoleModule(RoleModuleTab roleModuleTab) {
		
		return 0;
	}

	public List<ModuleTree> selectRoleModule(RoleModuleTab roleModuleTab) {
		List<ModuleTree> checkTree = treeNode.checkTree(moduleMapper.selectAllModuble(), moduleMapper.selectModuleByRoleId(roleModuleTab.getRoleId()));
		return treeNode.parseTree(checkTree);
	}

}
