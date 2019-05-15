package com.ysd.service.zmf;

import java.util.ArrayList;
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

	public int updateRoleModule(String Modules,int RoleId) {
		String[] arr = Modules.split(",");
		List<String> list1 = new ArrayList<String>();
		List<String> list = roleMapper.selectModuleIdByRoleId(RoleId);
		
		for (int i = 0; i < arr.length; i++)list1.add(arr[i]);//将数组转换成集合
		
		List<Integer> addList = new ArrayList<Integer>();
		List<Integer> deleteList = new ArrayList<Integer>();

		for (int i = 0; i < list1.size(); i++) {
			 if(!list.contains(list1.get(i))) {
				 addList.add(Integer.parseInt(list1.get(i)));
			 }
		}
		for (int i = 0; i < list.size(); i++) {
			if(!list1.contains(list.get(i))) {
				deleteList.add(Integer.parseInt(list.get(i)));
			 }
		}
		int jg = 0;
		if(addList.size()>0)jg= addRoleModule(RoleId,addList);
		if(deleteList.size()>0)jg= removeRoleModule(RoleId,deleteList);
		return jg;
	}
	private int addRoleModule(int RoleId,List<Integer> addList) {
		int jg = 0;
		RoleModuleTab role = new RoleModuleTab();
		for (int i = 0; i < addList.size(); i++) {
			role.setRoleId(RoleId);
			role.setModuleId(addList.get(i));
			jg=roleMapper.insertRoleModule(role);
		}
		return jg;
	}
	private int removeRoleModule(int RoleId,List<Integer> deleteList) {
		int jg = 0;
		RoleModuleTab role = new RoleModuleTab();
		for (int i = 0; i < deleteList.size(); i++) {
			role.setRoleId(RoleId);
			role.setModuleId(deleteList.get(i));
			jg=roleMapper.deleteRoleModule(role);
		}
		return jg;
	}
	public List<ModuleTree> selectRoleModule(RoleModuleTab roleModuleTab) {
		List<ModuleTree> selectModuleByRoleId = moduleMapper.selectModuleByRoleId(roleModuleTab.getRoleId());
		List<ModuleTree> checkTree = treeNode.checkTree(moduleMapper.selectAllModuble(),selectModuleByRoleId);
		return treeNode.parseTree(checkTree);
	}

}
