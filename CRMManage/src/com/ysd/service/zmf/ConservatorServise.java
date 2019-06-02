package com.ysd.service.zmf;

import java.util.List;

import com.ysd.entity.zmf.ModuleTree;
import com.ysd.entity.zmf.PieChart;

public interface ConservatorServise {

	/**
	 * 根据用户编号查询对应的所有模块
	 * @return
	 */
	List<ModuleTree> selectModuleByRoleId(Integer userId);
	
	/**
	 * 统计学生的选取专业
	 * @return
	 */
	List<PieChart> selectStudentLearnForward();
}
