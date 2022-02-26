package com.ldg.subway.side;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ldg.subway.side.beverage.BeverageService;
import com.ldg.subway.side.beverage.BeverageVO;
import com.ldg.subway.side.cookie.CookieService;
import com.ldg.subway.side.cookie.CookieVO;
import com.ldg.subway.side.potatoe.PotatoeService;
import com.ldg.subway.side.potatoe.PotatoeVO;

@Controller
public class SideController {
	
	@Resource(name="beverageService")
	private BeverageService beverageService;
	
	@Resource(name="cookieService")
	private CookieService cookieService;
	
	@Resource(name="potatoeService")
	private PotatoeService potatoeService;
	
	@RequestMapping("/iframe/sideAll")
	public String getAllVeg(Model model) throws Exception {
		List<BeverageVO> bList = beverageService.getAllBeverage();
		List<CookieVO> cList = cookieService.getAllCookie();
		List<PotatoeVO> pList = potatoeService.getAllPotatoe();
		
		System.out.println(cList);
		System.out.println(pList);
		
		model.addAttribute("bList", bList);
		model.addAttribute("cList", cList);
		model.addAttribute("pList", pList);
		
		return "/iframe/sideAll";
	}

}
