package com.ldg.subway.sandwich;

import lombok.Data;

@Data
public class SandwichNameVO {
	private String meat, bread, cheese, sauce, veg;
	private int price;
	public SandwichNameVO(String meat, String bread, String cheese, String sauce, String veg, int price) {
		super();
		this.meat = meat;
		this.bread = bread;
		this.cheese = cheese;
		this.sauce = sauce;
		this.veg = veg;
		this.price = price;
	}
	public SandwichNameVO() { }
	
	
	
	
	

}
