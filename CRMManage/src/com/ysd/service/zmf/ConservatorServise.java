package com.ysd.service.zmf;

import java.util.List;

import com.ysd.entity.zmf.ModuleTree;
import com.ysd.entity.zmf.PieChart;

public interface ConservatorServise {

	/**
	 * �����û���Ų�ѯ��Ӧ������ģ��
	 * @return
	 */
	List<ModuleTree> selectModuleByRoleId(Integer userId);
	
	/**
	 * ͳ��ѧ����ѡȡרҵ
	 * @return
	 */
	List<PieChart> selectStudentLearnForward();
}
