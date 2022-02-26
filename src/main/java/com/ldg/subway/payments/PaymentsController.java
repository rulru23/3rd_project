package com.ldg.subway.payments;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ldg.subway.api.AccessToken;
import com.ldg.subway.sandwich.SandwichNameVO;
import com.ldg.subway.sandwich.SandwichService;
import com.ldg.subway.sandwich.SandwichVO;
import com.ldg.subway.sandwich.bread.BreadService;
import com.ldg.subway.sandwich.cheese.CheeseService;
import com.ldg.subway.sandwich.meat.MeatService;
import com.ldg.subway.sandwich.sauce.SauceService;
import com.ldg.subway.sandwich.veg.VegService;
import com.ldg.subway.side.SideNameVO;
import com.ldg.subway.side.SideService;
import com.ldg.subway.side.SideVO;
import com.ldg.subway.side.beverage.BeverageService;
import com.ldg.subway.side.cookie.CookieService;
import com.ldg.subway.side.potatoe.PotatoeService;

@Controller
public class PaymentsController {

	AccessToken accessToken = new AccessToken();
	
	@Resource(name = "paymentsService")
	private PaymentsService paymentsService;
	
	//-----------------
	
	@Resource(name="sandwichService")
	private SandwichService sandwichService;
	
	@Resource(name="sideService")
	private SideService sideService;
	
	@Resource(name="breadService")
	private BreadService breadService;
	
	@Resource(name="meatService")
	private MeatService meatService;
	
	@Resource(name="cheeseService")
	private CheeseService cheeseService;
	
	@Resource(name="sauceService")
	private SauceService sauceService;
	
	@Resource(name="vegService")
	private VegService vegService;
	
	@Resource(name="cookieService")
	private CookieService cookieService;
	
	@Resource(name="potatoeService")
	private PotatoeService potatoeService;
	
	@Resource(name="beverageService")
	private BeverageService beverageService;
	
	//-----------------
	
	@RequestMapping(value = "/payment")
	public String home(Model model) {
		
		List<PaymentsVO> paymentsList = paymentsService.getAllPayments();
		for(int i = 0; i < paymentsList.size(); i++) {
			System.out.println(i + "행   :  " + paymentsList.get(i).getMerchant_uid());
		}
		
		
		System.out.println(accessToken.getAccessToken());
		//accessToken.getInfo();
		model.addAttribute("AccessToken", accessToken.getAccessToken());
		return "payment/payment";
	}
	
	@RequestMapping(value = "/payment/paySuccess")
	public String complete() {
		return "payment/paySuccess";
	}
	
	
	@RequestMapping(value = "/payment/cancelSuccess")
	public String canclePay() {
		return "payment/cancelSuccess";
	}
	
	@RequestMapping(value = "/payment/adminPayCancel")
	public String adminPayCancel(Model model) {
		List<PaymentsVO> paymentsList = paymentsService.getAllPayments();
		System.out.println(paymentsList);
		model.addAttribute("orderList", paymentsList);
		return "payment/adminPayCancel";
	}
	
	@RequestMapping(value = "/paymet/cancelInfo/imp_uid/{imp_uid}/menu_price/{menu_price}/merchant_uid/{merchant_uid}/payment_id/{payment_id}")
	public String cancelInfo(Model model, @PathVariable String imp_uid, @PathVariable String menu_price, 
			@PathVariable String merchant_uid, @PathVariable String payment_id) {
		model.addAttribute("menu_price", menu_price);
		model.addAttribute("imp_uid", imp_uid);
		model.addAttribute("merchant_uid", merchant_uid);
		model.addAttribute("payment_id", payment_id);
		return "payment/cancelInfo";
	}
	
	//-----------------
	
	@RequestMapping("/allPayments")
	public String allPayments(HttpSession session, Model model) throws Exception {
		PaymentsVO pVO = new PaymentsVO();
		pVO.setMem_id((String) session.getAttribute("user"));
		
		String payment_id = paymentsService.getPaymentsById(pVO);
		
		if(payment_id == null) {
			model.addAttribute("na", "na");
		}else {
			
			PaymentsVO pVO2 = paymentsService.getPayment(payment_id);
			
			if(pVO2.getMenu_price() == 0) {
				model.addAttribute("na", "na");
			
			}else {
			
			List<SandwichVO> sandList = sandwichService.getAllSandwichByid(payment_id);
			List<SandwichNameVO> sandName = new ArrayList<SandwichNameVO>();
			
			for(SandwichVO tmp: sandList) {
				
				SandwichNameVO sandNameVO = new SandwichNameVO(
						meatService.getMeatById(tmp.getMeat_id()+"").getMeat(),
						breadService.getBreadById(tmp.getBread_id()+"").getBread(),
						cheeseService.getCheeseById(tmp.getCheese_id()+"").getCheese(),
						sauceService.getSauceById(tmp.getSauce_id()+"").getSauce(),
						vegService.getVegById(tmp.getVeg_id()+"").getVeg(),
						meatService.getMeatById(tmp.getMeat_id()+"").getPrice()
						);
						
				sandName.add(sandNameVO);
			}
			
			
			List<SideVO> sideList = sideService.getAllSideById(payment_id);
			List<SideNameVO> sideName = new ArrayList<SideNameVO>();
			
			
			for(SideVO tmp: sideList) {
				String cookie, potatoe;
				SideNameVO sideNameVO;
				if(tmp.getPotatoe_id() == 0) {
					cookie = cookieService.getAllCookieById(tmp.getCookie_id()+"").getCookie();
					sideNameVO = new SideNameVO(cookie,"",beverageService.getBeverageById(tmp.getBeverage_id()+"").getBeverage(),0);
				}else {
					potatoe = potatoeService.getPotatoeById(tmp.getPotatoe_id()+"").getPotatoe();
					sideNameVO = new SideNameVO("",potatoe,beverageService.getBeverageById(tmp.getBeverage_id()+"").getBeverage(),0);
			
				}
				sideName.add(sideNameVO);
				
			}
			model.addAttribute("sandList", sandList);
			model.addAttribute("sandName", sandName);
			model.addAttribute("sideName", sideName);
			model.addAttribute("payment", pVO2);
			}
		}
		
		return "/payment/paymentsList";
	}

	@RequestMapping("/paymentsProcess")
	public String paymentsProcess(@RequestParam HashMap<String, String> map) throws Exception {
		
		int side_id =  Integer.parseInt(map.get("side_id").substring(map.get("side_id").length()-1));
		String sideName = map.get("side_id").substring(0, map.get("side_id").length()-1);
		
		int beverage_id = Integer.parseInt(map.get("beverage_id"));
		

		//payments DB
		int menu_price = Integer.parseInt(map.get("menu_price"));
		int payment_id = Integer.parseInt(map.get("payment_id"));
		PaymentsVO pVO = new PaymentsVO();
		pVO.setMenu_price(menu_price);
		pVO.setPayment_id(payment_id);
		  
		int paymentsProcess = paymentsService.paymentsProcess(pVO);
		 
		//sanwich DB
		int sandwichInsert = sandwichService.insertSandwich(map);
		 
		//side DB
		SideVO sVO = new SideVO();
		sVO.setPayment_id(payment_id);
		sVO.setBeverage_id(beverage_id);
		
		if(sideName.equals("cookie")) {
			sVO.setCookie_id(side_id);
		}else {
			sVO.setPotatoe_id(side_id);
		}
		int sideInsert = sideService.insertSide(sVO);
		
		
			 	
		return "redirect:/allPayments";
	}
	

}