package com.ysd.entity.hpy;
//��ѯʦѧ������
public class ConsultantStuCondition {
	private String	Name;
	private String	Phone;
	private Integer	AskerId;
	private String	IsPay;
	private Integer	IsValid;
	private String	QQ;
	private String	IsReturnVist;
	private String	minHomeTime;
	private String	maxHomeTime;
	private String	minPayTime;
	private String	maxPayTime;
	private String	minInClassTime;
	private String	maxInClassTime;
	private String	minFirstVisitTime;
	private String	maxFirstVisitTime;
	private String	minCreateTime;
	private String	maxCreateTime;
	public String getName() {
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
	public Integer getAskerId() {
		return AskerId;
	}
	public void setAskerId(Integer askerId) {
		AskerId = askerId;
	}
	public String getIsPay() {
		return IsPay;
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
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	public String getIsReturnVist() {
		return IsReturnVist;
	}
	public void setIsReturnVist(String isReturnVist) {
		IsReturnVist = isReturnVist;
	}
	public String getMinHomeTime() {
		return minHomeTime;
	}
	public void setMinHomeTime(String minHomeTime) {
		this.minHomeTime = minHomeTime;
	}
	public String getMaxHomeTime() {
		return maxHomeTime;
	}
	public void setMaxHomeTime(String maxHomeTime) {
		this.maxHomeTime = maxHomeTime;
	}
	public String getMinPayTime() {
		return minPayTime;
	}
	public void setMinPayTime(String minPayTime) {
		this.minPayTime = minPayTime;
	}
	public String getMaxPayTime() {
		return maxPayTime;
	}
	public void setMaxPayTime(String maxPayTime) {
		this.maxPayTime = maxPayTime;
	}
	public String getMinInClassTime() {
		return minInClassTime;
	}
	public void setMinInClassTime(String minInClassTime) {
		this.minInClassTime = minInClassTime;
	}
	public String getMaxInClassTime() {
		return maxInClassTime;
	}
	public void setMaxInClassTime(String maxInClassTime) {
		this.maxInClassTime = maxInClassTime;
	}
	public String getMinFirstVisitTime() {
		return minFirstVisitTime;
	}
	public void setMinFirstVisitTime(String minFirstVisitTime) {
		this.minFirstVisitTime = minFirstVisitTime;
	}
	public String getMaxFirstVisitTime() {
		return maxFirstVisitTime;
	}
	public void setMaxFirstVisitTime(String maxFirstVisitTime) {
		this.maxFirstVisitTime = maxFirstVisitTime;
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
	@Override
	public String toString() {
		return "ConsultantStuCondition [Name=" + Name + ", Phone=" + Phone + ", AskerId=" + AskerId + ", IsPay=" + IsPay
				+ ", IsValid=" + IsValid + ", QQ=" + QQ + ", IsReturnVist=" + IsReturnVist + ", minHomeTime="
				+ minHomeTime + ", maxHomeTime=" + maxHomeTime + ", minPayTime=" + minPayTime + ", maxPayTime="
				+ maxPayTime + ", minInClassTime=" + minInClassTime + ", maxInClassTime=" + maxInClassTime
				+ ", minFirstVisitTime=" + minFirstVisitTime + ", maxFirstVisitTime=" + maxFirstVisitTime
				+ ", minCreateTime=" + minCreateTime + ", maxCreateTime=" + maxCreateTime + "]";
	}
	
	
}