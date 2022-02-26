package com.ldg.subway.side;

import lombok.Data;

@Data
public class SideNameVO {
	private String cookie, potatoe, beverage;
	private int price;
	public SideNameVO(String cookie, String potatoe, String beverage, int price) {
		super();
		this.cookie = cookie;
		this.potatoe = potatoe;
		this.beverage = beverage;
		this.price = price;
	}
	public SideNameVO() {}
	
	

}
