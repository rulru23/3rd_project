package com.ldg.subway.payments;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentsDAO {
	
	public List<PaymentsVO> getAllPayments();
	public void insertPayments(String imp_uid, String merchant_uid, String payment_date, int menu_price, String mem_id); //수정필요함 (update로)
	public void deletePayments(String imp_uid);
	
	//지용이꺼
	public int insertInitialPayments(PaymentsVO pVO);
	public String getPaymentsById(PaymentsVO pVO);
	public int paymentsProcess(PaymentsVO pVO);
	public PaymentsVO getPayment(String payment_id);
	public int priceDecrease(String payment_id, int menu_price);
	public void updatePaymentInfo(String imp_uid, String merchant_uid, String payment_date, int payment_id);
}
