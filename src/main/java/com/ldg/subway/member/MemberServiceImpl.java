package com.ldg.subway.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void join(String mem_id, String mem_pw, String mem_name, String mem_tel, String mem_address) {
		System.out.println("회원 정보 추가");
		
		memberDAO.join(mem_id, mem_pw, mem_name, mem_tel, mem_address);
	}
	
	@Override
	public String login(String mem_id) {
		System.out.println(mem_id + " 계정 확인");
		
		return memberDAO.login(mem_id);
	}
	
	@Override
	public void secession(int secession) {
		memberDAO.secession(secession);
	}

}
