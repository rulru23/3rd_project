package com.ldg.subway.sandwich.veg;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class VegController {
	@Resource(name="vegService")
	private VegService vegService;
	
	@RequestMapping("/iframe/vegAll")
	public String getAllVeg(Model model) throws Exception {
		List<VegVO> vList = vegService.getAllVeg();
		model.addAttribute("vList", vList);
		return "/iframe/vegAll";
	}

}
