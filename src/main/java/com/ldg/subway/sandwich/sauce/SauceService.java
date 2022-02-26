package com.ldg.subway.sandwich.sauce;

import java.util.List;

public interface SauceService {
	public List<SauceVO> getAllSauce() throws Exception;
	public SauceVO getSauceById(String sauce_id) throws Exception;
}
