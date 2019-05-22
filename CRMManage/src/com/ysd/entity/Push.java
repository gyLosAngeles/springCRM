package com.ysd.entity;

public class Push {
	private Integer id;
	private Integer studentid;
	private String studentname;
	private String context;
	private String zxname;
	private Integer isreader;
	private String tstime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStudentid() {
		return studentid;
	}
	public void setStudentid(Integer studentid) {
		this.studentid = studentid;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	
	public String getZxname() {
		return zxname;
	}
	public void setZxname(String zxname) {
		this.zxname = zxname;
	}
	
	public Integer getIsreader() {
		return isreader;
	}
	public void setIsreader(Integer isreader) {
		this.isreader = isreader;
	}
	public String getTstime() {
		return tstime;
	}
	public void setTstime(String tstime) {
		this.tstime = tstime;
	}
	@Override
	public String toString() {
		return "Push [id=" + id + ", studentid=" + studentid + ", studentname=" + studentname + ", context=" + context
				+ ", zxname=" + zxname + ", isreader=" + isreader + ", tstime=" + tstime + "]";
	}
	
	
}
