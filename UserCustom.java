package com.ysd.entity.zmf;

import java.util.List;

import com.ysd.entity.RoleTab;
import com.ysd.entity.UserTab;

public class UserCustom extends UserTab {

	private List<RoleTab> role;

	 
	public List<RoleTab> getRole() {
		return role;
	}


	public void setRole(List<RoleTab> role) {
		this.role = role;
	}


	@Override
	public String toString() {
		return "UserCustom [role=" + role + "]";
	}

	
}
