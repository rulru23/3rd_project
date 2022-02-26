package com.ldg.subway.side.beverage;

import lombok.Data;

@Data
public class BeverageVO {
	private int beverage_id, price, qty;
	private String beverage, category;
	public BeverageVO(int beverage_id, int price, int qty, String beverage, String category) {
	//	super();
		this.beverage_id = beverage_id;
		this.price = price;
		this.qty = qty;
		this.beverage = beverage;
		this.category = category;
	}
	public BeverageVO() {}
	

}
