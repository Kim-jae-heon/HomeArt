package com.homeart.domain.admin;

import lombok.Data;

@Data
public class AdminCriteria {
	private int pageNum;
	private int amount;
	
	private String keyword;
	
	public AdminCriteria() {
		this(1,5);
	}
	
	public AdminCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
