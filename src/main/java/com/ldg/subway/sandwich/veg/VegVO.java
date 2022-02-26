package com.ldg.subway.sandwich.veg;

import lombok.Data;

@Data
public class VegVO {
	private int veg_id, qty;
	private String veg;
	public VegVO(int veg_id, int qty, String veg) {
		super();
		this.veg_id = veg_id;
		this.qty = qty;
		this.veg = veg;
	}
	public VegVO() {}
	
	

}
