package com.ldg.subway.sandwich.cheese;

import lombok.Data;

@Data
public class CheeseVO {
	private int cheese_id, qty;
	private String cheese;
	public CheeseVO() {}
	public CheeseVO(int cheese_id, int qty, String cheese) {
	//	super();
		this.cheese_id = cheese_id;
		this.qty = qty;
		this.cheese = cheese;
	}
	
	

}
