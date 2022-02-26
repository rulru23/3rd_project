package com.ldg.subway.payments;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class PaymentsVO {
	
	private String imp_uid;
	private String merchant_uid;
	private String payment_date;
	private String mem_id;
	private int payment_id;
	private int menu_price;

}
