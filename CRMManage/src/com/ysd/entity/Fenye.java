package com.ysd.entity;

import com.ysd.entity.hpy.ConsultantStuCondition;
import com.ysd.entity.zmf.UserChecksCondition;
import com.ysd.entity.zmf.UserCondition;

public class Fenye {

	private Integer page;//Ò³Êý
	private Integer rows;//ÌõÊý
	private UserCondition userCondition; 
	private UserChecksCondition userChecksCondition; 
	private ConsultantStuCondition consultantStuCondition;
	public UserChecksCondition getUserChecksCondition() {
		return userChecksCondition;
	}
	public void setUserChecksCondition(UserChecksCondition userChecksCondition) {
		this.userChecksCondition = userChecksCondition;
	}
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
		if(page<0||page==null) {
			return 0;
		}
		return (page-1)*rows;
	}
	
	public ConsultantStuCondition getConsultantStuCondition() {
		return consultantStuCondition;
	}
	public void setConsultantStuCondition(ConsultantStuCondition consultantStuCondition) {
		this.consultantStuCondition = consultantStuCondition;
	}
	@Override
	public String toString() {
		return "Fenye [page=" + page + ", rows=" + rows + ", userCondition=" + userCondition + "]";
	}
	 
	 
}
