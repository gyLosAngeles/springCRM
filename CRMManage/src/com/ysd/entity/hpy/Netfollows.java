package com.ysd.entity.hpy;

import org.springframework.stereotype.Component;

@Component
public class Netfollows {
	private Integer Id;
	private Integer StudentId;
	private String StudentName;
	private String FollowTime;
	private String NextFollowTime;
	private String Content;
	private Integer UserId;
	private String FollowType;
	private String CreateTime;
	private Integer FollowState;
	private String Remarks;
	private CustomerStudents customerStudents;
	private Askers askers;
	
	
	public String getRemarks() {
		return Remarks;
	}
	public void setRemarks(String remarks) {
		Remarks = remarks;
	}
	public CustomerStudents getCustomerStudents() {
		return customerStudents;
	}
	public void setCustomerStudents(CustomerStudents customerStudents) {
		this.customerStudents = customerStudents;
	}
	public Askers getAskers() {
		return askers;
	}
	public void setAskers(Askers askers) {
		this.askers = askers;
	}
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public Integer getStudentId() {
		return StudentId;
	}
	public void setStudentId(Integer studentId) {
		StudentId = studentId;
	}
	public String getStudentName() {
		return StudentName;
	}
	public void setStudentName(String studentName) {
		StudentName = studentName;
	}
	public String getFollowTime() {
		return FollowTime;
	}
	public void setFollowTime(String followTime) {
		FollowTime = followTime;
	}
	public String getNextFollowTime() {
		return NextFollowTime;
	}
	public void setNextFollowTime(String nextFollowTime) {
		NextFollowTime = nextFollowTime;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Integer getUserId() {
		return UserId;
	}
	public void setUserId(Integer userId) {
		UserId = userId;
	}
	public String getFollowType() {
		return FollowType;
	}
	public void setFollowType(String followType) {
		FollowType = followType;
	}
	public String getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}
	public Integer getFollowState() {
		return FollowState;
	}
	public void setFollowState(Integer followState) {
		FollowState = followState;
	}
	
	
}
