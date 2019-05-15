package com.ysd.entity.zmf;

import org.springframework.stereotype.Component;

@Component
public class LoginReponse {

	private String message;//返回值信息
	private boolean success;//返回状态
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	@Override
	public String toString() {
		return "LoginReponse [message=" + message + ", success=" + success + "]";
	}
	
}
