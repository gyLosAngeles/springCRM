package com.ysd.service.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.zmf.ModuleMapper;
import com.ysd.entity.ModuleTab;
import com.ysd.entity.zmf.ModuleTree;
import com.ysd.util.TreeNode;

@Service
public class ModuleServiseImpl implements ModuleServise {

	@Autowired
	private ModuleMapper moduleMapper;
	@Autowired
	private TreeNode treeNode;
	public List<ModuleTree> selectModuleAll() {
		return treeNode.parseTree(moduleMapper.selectAllModuble());
	}
	public int addtModule(ModuleTab moduleTab) {
		return moduleMapper.insertModule(moduleTab);
	}
	public int removeModule(ModuleTab moduleTab) {
		return moduleMapper.deleteModule(moduleTab);
	}
	public int updateModule(ModuleTab moduleTab) {
		return moduleMapper.updateModule(moduleTab);
	}
	
}
