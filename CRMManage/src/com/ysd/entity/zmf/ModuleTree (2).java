package com.ysd.entity.zmf;

import java.util.List;

public class ModuleTree {

	private int id;//id
	private String text;//标题内容
	private String state;//状态 closed-合起、open-打开
	private boolean checked;//是否选中
	private List<ModuleTree> children;//子节点，子节点有0个或多个，所以用链表存放
	private int level_id;//层级       根层级为1
	private TreeAttributes attributes;//补充属性
	private int parent_id;//父节点   根节点为0
	
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public TreeAttributes getAttributes() {
		return attributes;
	}
	public void setAttributes(TreeAttributes attributes) {
		this.attributes = attributes;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public List<ModuleTree> getChildren() {
		return children;
	}
	public void setChildren(List<ModuleTree> children) {
		this.children = children;
	}
	public int getLevel_id() {
		return level_id;
	}
	public void setLevel_id(int level_id) {
		this.level_id = level_id;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	@Override
	public String toString() {
		return "ModuleTree [id=" + id + ", text=" + text + ", state=" + state + ", children=" + children + ", level_id="
				+ level_id + ", parent_id=" + parent_id + "]";
	}
}
