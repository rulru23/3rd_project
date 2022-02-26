package com.ldg.subway.sandwich;

import lombok.Data;

@Data
public class SandwichVO {
	private int sandwich_id, payment_id, meat_id, bread_id, cheese_id, sauce_id, veg_id;

	public SandwichVO(int sandwich_id, int payment_id, int meat_id, int bread_id, int cheese_id, int sauce_id,
			int veg_id) {
		super();
		this.sandwich_id = sandwich_id;
		this.payment_id = payment_id;
		this.meat_id = meat_id;
		this.bread_id = bread_id;
		this.cheese_id = cheese_id;
		this.sauce_id = sauce_id;
		this.veg_id = veg_id;
	}
	public SandwichVO() {}

}
