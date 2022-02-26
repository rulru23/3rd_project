package com.ldg.subway.sandwich.bread;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BreadController {

	@Resource(name="breadService")
	BreadService breadService;
	
	@RequestMapping("/iframe/breadAll")
	public String getAllBread(Model model) throws Exception {
		System.out.println("bread controller 접속 완료");
		List<BreadVO> bList = breadService.getAllBread();
		System.out.println(bList);
		model.addAttribute("bList", bList);
		return "/iframe/breadAll";
	}
	
	
	
}
