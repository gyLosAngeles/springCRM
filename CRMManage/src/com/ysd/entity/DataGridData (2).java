package com.ysd.entity;

import java.util.List;

import org.springframework.stereotype.Component;
//数据表格的json形式
@Component
public class DataGridData {
	private Integer total;
	private List<?> rows;
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
	@Override
	public String toString() {
		return "DataGridData [total=" + total + ", rows=" + rows + "]";
	}
	
}
