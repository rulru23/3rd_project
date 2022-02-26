package com.ldg.subway.member;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface MemberDAO {
	//회원가입
	public void join(String mem_id, String mem_pw, String mem_name, String mem_tel, String mem_address);
	
	//로그인
	public String login(String mem_id);
	
	public void secession(int secession);
}
