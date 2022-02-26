package com.ldg.subway.side.cookie;

import lombok.Data;

@Data
public class CookieVO {
	private int cookie_id, price, qty;
	private String cookie, category;
	public CookieVO(int cookie_id, int price, int qty, String cookie, String category) {
		//super();
		this.cookie_id = cookie_id;
		this.price = price;
		this.qty = qty;
		this.cookie = cookie;
		this.category = category;
	}
	public CookieVO() { }
	

}
