package com.ldg.subway.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberRestController {
	
	@Autowired
	private MemberService memberService;

	@ResponseBody
	@PostMapping(value = "/login/memCheck")
	public HashMap<String, Object> memCheck(@RequestBody HashMap<String, Object> map,HttpServletRequest request){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String mem_id = (String)map.get("mem_id");
		
		if(map.size() > 0) {
			String checkPw = memberService.login(mem_id);
			
			if(checkPw == null) {

				result.put("error", "입력한 아이디가 존재하지 않습니다.");
			}else if(!checkPw.equals((String)map.get("mem_pw"))) {
				
				result.put("error", "비밀번호가 일치하지 않습니다.");
			}else {
				
				result.put("success", "로그인 완료");
				
				//setting session
				HttpSession session = request.getSession();
				session.setAttribute("user", mem_id);
				
			}
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/login/joinCheck")
	public HashMap<String, Object> joinCheck(@RequestBody HashMap<String, Object> map){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String mem_id = (String)map.get("mem_id");
		String mem_pw = (String)map.get("mem_pw");
		String mem_name = (String)map.get("mem_name");
		String mem_tel = (String)map.get("mem_tel");
		String mem_address = (String)map.get("mem_address");
		
		if(map.size() > 0) {
			
			String checkPw = memberService.login(mem_id);
			if(mem_id.isEmpty()) {
				result.put("error", "아이디를 입력해 주세요.");
			}else if(mem_pw.isEmpty()) {
				result.put("error", "비밀번호를 입력해 주세요.");
			}else if(mem_name.isEmpty()) {
				result.put("error", "이름을 입력해 주세요.");
			}else if(mem_tel.isEmpty()) {
				result.put("error", "전화번호를 입력해 주세요.");
			}else if(mem_address.isEmpty()) {
				result.put("error", "주소를 입력해 주세요.");
			}else if(checkPw != null) {
				result.put("error", "중복된 아이디 입니다.");
			}else {
				result.put("success", "회원가입 완료");
				memberService.join(mem_id, mem_pw, mem_name, mem_tel, mem_address);
			}
		}
		
		return result;
	}
}
