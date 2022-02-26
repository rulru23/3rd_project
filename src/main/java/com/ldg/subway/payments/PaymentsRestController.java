package com.ldg.subway.payments;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ldg.subway.api.CancelPayment;
import com.ldg.subway.sandwich.SandwichService;
import com.ldg.subway.side.SideService;

@RestController
public class PaymentsRestController {

	@Resource(name = "paymentsService")
	private PaymentsService paymentsService;
	
	@Resource(name="sandwichService")
	private SandwichService sandwichService;
	
	@Resource(name="sideService")
	private SideService sideService;
	
	@ResponseBody
	@PostMapping(path = "/payment/payProcess")
	public HashMap<String, String> complete(@RequestBody HashMap<String, String> map, HttpSession session) {
		
		System.out.println(Integer.parseInt((String)map.get("payment_id")));
		
		HashMap<String, String> result = new HashMap<String, String>();
		Date data = new Date();
		String payment_date;
		String mem_id = (String)session.getAttribute("user");
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		
		System.out.println("결제정보 받아옴 (RestController)");
		System.out.println("결제 정보 : " + map);
		
		if(map.size() > 0) {
			result = map;
			result.put("everythings_fine", "true");

			payment_date = simpleDateFormat.format(data);
			
			paymentsService.updatePaymentInfo(map.get("imp_uid"), map.get("merchant_uid"), payment_date, Integer.parseInt((String)map.get("payment_id")));
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping(path = "/payment/cancel")
	public HashMap<String, Object> cancel(@RequestBody HashMap<String, Object> map) {
		System.out.println("환불정보 받아옴 (RestController) ");
		//System.out.println(map);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		if(map.size() > 0) {
			
			System.out.println((String)map.get("imp_uid"));
			
			result.put("reason", (String)map.get("reason"));
			result.put("imp_uid", (String)map.get("imp_uid"));
			result.put("amount", (Integer)map.get("cancel_request_amount"));
			result.put("everythings_fine", true);
			
			paymentsService.deletePayments((String)map.get("imp_uid")); //db에서 내역삭제
		}
		
		return result;
	}
	
	
	
	@ResponseBody
	@PostMapping(path = "/payment/cancelProcess")
	public HashMap<String, Object> cancelProcess(@RequestBody HashMap<String, Object>map){
		System.out.println("결제 취소 시작");
		System.out.println(map);
		CancelPayment cancelPayment = new CancelPayment(); // 결제취소
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		if(map.size() > 0) {
			
			cancelPayment.doCanelPayment((String)map.get("reason"), (String)map.get("imp_uid"), (Integer)map.get("cancel_request_amount"));
			
			//db에서 내역삭제
			paymentsService.deletePayments((String)map.get("imp_uid")); 
			
			result.put("result", "결제 취소 완료");
			result.put("everythings_fine", true);
		}
		
		return result;
	}
	
	@PostMapping("/insertInitialPayments")
	public String insertInitialPayments(HttpSession session) throws Exception {
		String mem_id = (String) session.getAttribute("user");
		
		PaymentsVO pVO = new PaymentsVO();
		pVO.setMem_id(mem_id);
		
		String payment_id = paymentsService.getPaymentsById(pVO);
		if(payment_id == null) {
			payment_id = paymentsService.insertInitialPayments(pVO)+"";
		}
		return payment_id;
	}
	
	@PostMapping("/deleteSet")
	public String deleteSet(@RequestParam("id")String id,
							@RequestParam("pId")String pId,
							@RequestParam("cPrice")String cPrice) throws Exception {
		int sandSuccess  = sandwichService.deleteSand(id);
		int sideSuccess = sideService.deleteSide(id);
		int currentPrice = Integer.parseInt(cPrice.substring(0, cPrice.length()-1));
		
		int paymentSuccess = paymentsService.priceDecrease(pId,currentPrice);
		return "success";
	}
}
