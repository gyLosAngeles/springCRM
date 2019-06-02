package com.ysd.service.zmf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.wxx.StudentsMapper;
import com.ysd.dao.zmf.ModuleMapper;
import com.ysd.entity.zmf.ModuleTree;
import com.ysd.entity.zmf.PieChart;
import com.ysd.util.TreeNode;

@Service//管理员业务
public class ConservatorServiseImpl implements ConservatorServise {

	@Autowired
	private ModuleMapper moduleMapper;
	@Autowired
	private TreeNode treeNode;
	@Autowired
	private StudentsMapper  studentsMapper;
	public List<ModuleTree> selectModuleByRoleId(Integer userId) {
		return treeNode.parseTree_2(moduleMapper.selectModuleByUserId(userId));
	}
	 
	public List<PieChart> selectStudentLearnForward() {
		return studentsMapper.selectStudentLearnForward();
	}
}
