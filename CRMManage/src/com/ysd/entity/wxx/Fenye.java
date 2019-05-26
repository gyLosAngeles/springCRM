package com.ysd.entity.wxx;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ysd.entity.Askers;

@Component
public class Fenye {
private Integer page;
private Integer row;
private Integer total;
private List<?> rows;
private String Name;//名称
private String Phone;//电话
private String IsPay;//是否缴费
private Integer IsValid;//是否有效
private String IsReturnVist;//是否回访
private String QQ;//qq
private String ziXunName;//咨询师
private String minCreateTime;//创建时间
private String maxCreateTime;//创建时间
private String userName;//用户名称
private String roleName;//咨询师名称

public String getZiXunName() {
	return ziXunName;
}
public void setZiXunName(String ziXunName) {
	this.ziXunName = ziXunName;
}
public String getRoleName() {
	return roleName;
}
public void setRoleName(String roleName) {
	this.roleName = roleName;
}
private Askers askers;
public Integer getPage() {
	return page;
}
public void setPage(Integer page) {
	this.page = page;
}
public Integer getRow() {
	return row;
}
public void setRow(Integer row) {
	this.row = row;
}
public Integer getTotal() {
	return total;
}
public void setTotal(Integer total) {
	this.total = total;
}
public List<?> getRows() {
	return rows;
}
public void setRows(List<?> rows) {
	this.rows = rows;
}
public String getName() {
	if(Name!=null) {
		return Name.trim();
	}
	return Name;
}
public void setName(String name) {
	Name = name;
}
public String getPhone() {
	return Phone;
}
public void setPhone(String phone) {
	Phone = phone;
}
public String getIsPay() {
	return IsPay;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public void setIsPay(String isPay) {
	IsPay = isPay;
}
public Integer getIsValid() {
	return IsValid;
}
public void setIsValid(Integer isValid) {
	IsValid = isValid;
}
public String getIsReturnVist() {
	return IsReturnVist;
}
public void setIsReturnVist(String isReturnVist) {
	IsReturnVist = isReturnVist;
}
public String getQQ() {
	return QQ;
}
public void setQQ(String qQ) {
	QQ = qQ;
}

public String getMinCreateTime() {
	return minCreateTime;
}
public void setMinCreateTime(String minCreateTime) {
	this.minCreateTime = minCreateTime;
}
public String getMaxCreateTime() {
	return maxCreateTime;
}
public void setMaxCreateTime(String maxCreateTime) {
	this.maxCreateTime = maxCreateTime;
}

 
public Askers getAskers() {
	return askers;
}
public void setAskers(Askers askers) {
	this.askers = askers;
}
@Override
public String toString() {
	return "Fenye [page=" + page + ", row=" + row + ", total=" + total + ", rows=" + rows + ", Name=" + Name
			+ ", Phone=" + Phone + ", IsPay=" + IsPay + ", IsValid=" + IsValid + ", IsReturnVist=" + IsReturnVist
			+ ", QQ=" + QQ + ", minCreateTime=" + minCreateTime + ", maxCreateTime=" + maxCreateTime + ", askers="
			+ askers + "]";
}

}
