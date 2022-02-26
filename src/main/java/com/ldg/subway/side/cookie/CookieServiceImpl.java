package com.ldg.subway.side.cookie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cookieService")
public class CookieServiceImpl implements CookieService{

	@Autowired
	private CookieDAO cDAO;
	
	@Override
	public List<CookieVO> getAllCookie() throws Exception {
		
		return cDAO.getAllCookie();
	}

	@Override
	public CookieVO getAllCookieById(String cookie_id) throws Exception {
		
		return cDAO.getAllCookieById(cookie_id);
	}

}
