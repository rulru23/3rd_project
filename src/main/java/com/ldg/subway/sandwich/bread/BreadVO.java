package com.ldg.subway.sandwich.bread;

import lombok.Data;

@Data
public class BreadVO {
	private int bread_id, qty;
	private String bread;
	
	public BreadVO() { }
	
	public BreadVO(int bread_id, int qty, String bread) {
	//	super();
		this.bread_id = bread_id;
		this.qty = qty;
		this.bread = bread;
	}
}
