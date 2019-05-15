package com.ysd.entity;

import com.ysd.entity.zmf.UserCondition;

public class Fenye {

	private Integer page;//Ò³Êý
	private Integer rows;//ÌõÊý
	private UserCondition userCondition; 

	
	public void setPage(Integer page) {
		
		this.page =page ;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public UserCondition getUserCondition() {
		return userCondition;
	}
	public void setUserCondition(UserCondition userCondition) {
		this.userCondition = userCondition;
	}
	public Integer getPage() {
		page = page>0? (page-1)*rows:0;
		return page;
	}
	@Override
	public String toString() {
		return "Fenye [page=" + page + ", rows=" + rows + ", userCondition=" + userCondition + "]";
	}
	 
	 
}
