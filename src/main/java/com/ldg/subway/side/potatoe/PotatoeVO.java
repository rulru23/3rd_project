package com.ldg.subway.side.potatoe;

import lombok.Data;

@Data
public class PotatoeVO {
	private int potatoe_id, price, qty;
	private String potatoe, category;
	public PotatoeVO(int potatoe_id, int price, int qty, String potatoe, String category) {
		super();
		this.potatoe_id = potatoe_id;
		this.price = price;
		this.qty = qty;
		this.potatoe = potatoe;
		this.category = category;
	}
	public PotatoeVO() {}
	

}
