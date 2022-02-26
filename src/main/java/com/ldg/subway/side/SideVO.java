package com.ldg.subway.side;

import lombok.Data;

@Data
public class SideVO {
	private int side_id, payment_id, cookie_id, potatoe_id, beverage_id;

	public SideVO(int side_id, int payment_id, int cookie_id, int potatoe_id, int beverage_id) {
		super();
		this.side_id = side_id;
		this.payment_id = payment_id;
		this.cookie_id = cookie_id;
		this.potatoe_id = potatoe_id;
		this.beverage_id = beverage_id;
	}
	public SideVO() {}
	
	

}
