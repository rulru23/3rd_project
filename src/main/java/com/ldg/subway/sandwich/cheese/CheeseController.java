package com.ldg.subway.sandwich.cheese;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CheeseController {
	
	@Resource(name="cheeseService")
	private CheeseService cheeseService;
	
	@RequestMapping("/iframe/cheeseAll")
	public String getAllCheese(Model model) throws Exception {
		List<CheeseVO> cList = cheeseService.getAllCheese();
		model.addAttribute("cList", cList);
		return "/iframe/cheeseAll";
	}

}
