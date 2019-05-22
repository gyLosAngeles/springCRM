package com.ysd.entity.zmf;

public class StaffParcel {

	private Integer count;
	private String askerName;
	private Double weight;
	private int CheckState;
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getAskerName() {
		return askerName;
	}
	public void setAskerName(String askerName) {
		this.askerName = askerName;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	
	public int getCheckState() {
		return CheckState;
	}
	public void setCheckState(int checkState) {
		CheckState = checkState;
	}
	@Override
	public String toString() {
		return "StaffParcel [count=" + count + ", askerName=" + askerName + ", weight=" + weight + "]";
	}
	
}
