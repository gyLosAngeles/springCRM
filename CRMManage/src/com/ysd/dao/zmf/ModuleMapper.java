package com.ysd.dao.zmf;

import java.util.List;

import com.ysd.entity.ModuleTab;
import com.ysd.entity.zmf.ModuleTree;

public interface ModuleMapper {

	/**
	 * ���ݽ�ɫ��Ų�ѯ��Ӧ��ģ��
	 * @param roleId
	 * @return
	 */
	List<ModuleTree> selectModuleByRoleId(Integer roleId);
	/**
	 * ��ѯ���е�ģ��
	 * @return
	 */
	List<ModuleTree> selectAllModuble();
	/**
	 * ���ģ��
	 * @param moduleTab
	 * @return
	 */
	int insertModule(ModuleTab moduleTab);
	/**
	 * ɾ��ģ��
	 * @param moduleTab
	 * @return
	 */
	int deleteModule(ModuleTab moduleTab);
	/**
	 * �޸�ģ��
	 * @param moduleTab
	 * @return
	 */
	int updateModule(ModuleTab moduleTab);
	/**
	 * ��ѯ�û���Ӧ������ģ��
	 * @param userId
	 * @return
	 */
	List<ModuleTree> selectModuleByUserId(Integer userId);
	/**
	 * ��ѯģ���Ӧ�Ľ�ɫ����
	 * @param moduleId
	 * @return
	 */
	Integer selectRoleModuleCount(Integer moduleId);
	
}
