package com.ysd.service.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.zmf.ModuleMapper;
import com.ysd.entity.zmf.ModuleTree;
import com.ysd.util.TreeNode;

@Service//管理员业务
public class ConservatorServiseImpl implements ConservatorServise {

	@Autowired
	private ModuleMapper moduleMapper;
	@Autowired
	private TreeNode treeNode;
	
	public List<ModuleTree> selectModuleByRoleId(Integer userId) {
		return treeNode.parseTree(moduleMapper.selectModuleByUserId(userId));
	}
}
