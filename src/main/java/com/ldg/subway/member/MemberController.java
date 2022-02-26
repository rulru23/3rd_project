package com.ldg.subway.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
//	@Autowired
//	private MemberService memberService;
	
	@RequestMapping("/login")
	public String login() {
		System.out.println("login페이지로");
		return "member/login";
	}

	@RequestMapping("/join")
	public String join() {
		System.out.println("회원가입페이지로 가자");
		return "member/join";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		System.out.println("로그아웃");
		HttpSession session = request.getSession();
		session.invalidate(); // 비활성화 시킴으로 세션 끊김
		
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:"+ referer; // 이전 페이지로 리다이렉트
	}
}
