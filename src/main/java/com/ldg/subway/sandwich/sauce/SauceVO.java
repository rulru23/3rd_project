package com.ldg.subway.sandwich.sauce;

import lombok.Data;

@Data
public class SauceVO {
	private int sauce_id, qty;
	private String sauce;
	public SauceVO(int sauce_id, int qty, String sauce) {
		super();
		this.sauce_id = sauce_id;
		this.qty = qty;
		this.sauce = sauce;
	}
	public SauceVO() { }
	

}
