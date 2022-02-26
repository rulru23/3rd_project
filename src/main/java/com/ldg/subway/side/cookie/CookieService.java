package com.ldg.subway.side.cookie;

import java.util.List;

public interface CookieService {
	public List<CookieVO> getAllCookie() throws Exception;
	public CookieVO getAllCookieById(String cookie_id) throws Exception;

}
