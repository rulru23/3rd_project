package com.ldg.subway.sandwich.sauce;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SauceController {
	
	@Resource(name="sauceService")
	private SauceService sauceService;
	
	@RequestMapping("/iframe/sauceAll")
	public String getAllSauce(Model model) throws Exception {
		List<SauceVO> sList = sauceService.getAllSauce();
		model.addAttribute("sList",sList);
		return "/iframe/sauceAll";
	}

}
