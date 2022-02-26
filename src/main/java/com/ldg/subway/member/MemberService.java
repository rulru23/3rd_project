package com.ldg.subway.member;

public interface MemberService {
	
	public void join(String mem_id, String mem_pw, String mem_name, String mem_tel, String mem_address);
	
	public String login(String mem_id);
	
	public void secession(int secession);
}
