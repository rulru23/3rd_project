package com.ldg.subway.side.cookie;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CookieDAO {
	public List<CookieVO> getAllCookie();
	public CookieVO getAllCookieById(String cookie_id);

}
