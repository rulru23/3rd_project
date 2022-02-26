package com.ldg.subway;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubwayController {

	
	@RequestMapping("/")
	public String Main(Model model) throws Exception {
		return "index";
	}

}
