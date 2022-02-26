package com.ldg.subway.payments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("paymentsService")
public class PaymentsServiceImpl implements PaymentsService{
	
	@Autowired
	private PaymentsDAO paymentsDAO;
	
	@Override
	public List<PaymentsVO> getAllPayments(){
		return paymentsDAO.getAllPayments();
	}
	
	@Override
	public void insertPayments(String imp_uid, String merchant_uid, String payment_date, int menu_price, String mem_id) {
		System.out.println("imp_uid : " + imp_uid + "  merchant_uid : " + merchant_uid + "  amount : " + menu_price + 
				"  mem_id : " + mem_id + "  menu_id : " + "\n Inserting...");
		paymentsDAO.insertPayments(imp_uid, merchant_uid, payment_date, menu_price, mem_id);
	}
	
	@Override
	public void deletePayments(String imp_uid) {
		paymentsDAO.deletePayments(imp_uid);
		System.out.println("imp_uid : " + imp_uid + " 삭제완료");
	}
	
	@Override
	public int insertInitialPayments(PaymentsVO pVO){
		int payment_id = paymentsDAO.insertInitialPayments(pVO);
		return pVO.getPayment_id();
	}

	@Override
	public String getPaymentsById(PaymentsVO pVO){
		String payment_id = paymentsDAO.getPaymentsById(pVO);
		return payment_id;
	}

	@Override
	public int paymentsProcess(PaymentsVO pVO){
		return paymentsDAO.paymentsProcess(pVO);
	}

	@Override
	public PaymentsVO getPayment(String payment_id){
		
		return paymentsDAO.getPayment(payment_id);
	}

	@Override
	public int priceDecrease(String payment_id, int menu_price){
		
		return paymentsDAO.priceDecrease(payment_id, menu_price);
	}
	
	@Override
	public void updatePaymentInfo(String imp_uid, String merchant_uid, String payment_date, int payment_id) {
		
		System.out.println("결제 정보 갱신");
		
		paymentsDAO.updatePaymentInfo(imp_uid, merchant_uid, payment_date, payment_id);
	}
}
