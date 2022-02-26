package com.ldg.subway.sandwich.meat;

import lombok.Data;

@Data
public class MeatVO {
	private int mead_id, price, qty;
	private String meat, category;
	
	public MeatVO() { }
	public MeatVO(int mead_id, int price, int qty, String meat, String category) {
	//	super();
		this.mead_id = mead_id;
		this.price = price;
		this.qty = qty;
		this.meat = meat;
		this.category = category;
	}
	
	

}
