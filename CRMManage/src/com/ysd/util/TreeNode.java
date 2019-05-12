package com.ysd.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.ysd.entity.zmf.ModuleTree;
@Component
public class TreeNode {

	/**
	 *  将数据转换称为前台所需要的tree类型的数据
	 * @param list
	 * @return
	 */
	public List<ModuleTree> parseTree(List<ModuleTree> list){
		List<ModuleTree> tree = new ArrayList<ModuleTree>();
		for (ModuleTree treeNode : list) {
			if(treeNode.getParent_id()==0||treeNode.getParent_id()==treeNode.getId()) {
				treeNode.setChildren(getChildrenNode(treeNode.getId(), list));
				tree.add(treeNode);
			}
		}
		return tree;
	}
	private List<ModuleTree> getChildrenNode(int pid,List<ModuleTree> list){
		List<ModuleTree> childrenNode = new ArrayList<ModuleTree>();
		for (ModuleTree treeNode  : list) {
			if(pid == treeNode.getParent_id()) {
				treeNode.setChildren(getChildrenNode(treeNode.getId(), list));
				childrenNode.add(treeNode);
			}
		}
		return childrenNode;
	}
	/**
	 * 将tree变成选中状态
	 * @param totalList
	 * @param list
	 * @return
	 */
	public  List<ModuleTree> checkTree(List<ModuleTree> totalList,List<ModuleTree> list){
		for (int i = 0; i < list.size(); i++) {
			 for (int j = 0; j < totalList.size(); j++) {
				if(totalList.get(j).getId()==list.get(i).getId()) {
					totalList.get(j).setChecked(true);
				}
			}
		}
		return totalList;
	}
}
