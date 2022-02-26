package com.ldg.subway.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class MainController {

	@GetMapping("main/main")
	public String welcomeIndex() {
		return "main/main";
	}
}
