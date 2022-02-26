package com.ldg.subway.sandwich.meat;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MeatController {

	@Resource(name="meatService")
	private MeatService meatService;
	
	@RequestMapping("/iframe/meat")
	public String iframe(Model model) throws Exception {
		List<MeatVO> mList = meatService.getAllMeat();
		model.addAttribute("mList", mList);
		return "/iframe/meat";
	}
}
