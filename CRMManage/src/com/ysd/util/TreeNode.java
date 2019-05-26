package com.ysd.util;

import java.util.ArrayList;
import java.util.LinkedList;
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
	 * 不递归的方法
	 * @param list
	 * @return
	 */
	public List<ModuleTree> parseTree_2(List<ModuleTree> list){
		 for (int i = 0; i < list.size(); i++) {
				List<ModuleTree> list1 = new ArrayList<ModuleTree>();
				list.get(i).setChildren(list1);
				for (int j = 0; j < list.size(); j++) {
					if(list.get(i).getId()==list.get(j).getParent_id()) {
						list.get(i).getChildren().add(list.get(j));
					}
				}
			 }
			 List<ModuleTree> tree = new ArrayList<ModuleTree>();
			 for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getParent_id()==0) {
					tree.add(list.get(i));
				}
			}
			return tree;
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
					if(totalList.get(j).getParent_id()!=0)
					  totalList.get(j).setChecked(true);
					
				}
			}
		}
		return totalList;
	}
}
