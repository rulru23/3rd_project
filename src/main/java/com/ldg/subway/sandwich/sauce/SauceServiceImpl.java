package com.ldg.subway.sandwich.sauce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("sauceService")
public class SauceServiceImpl implements SauceService{

	@Autowired
	private SauceDAO sDAO;
	
	@Override
	public List<SauceVO> getAllSauce() throws Exception {
		return sDAO.getAllSauce();
	}

	@Override
	public SauceVO getSauceById(String sauce_id) throws Exception {
		
		return sDAO.getSauceById(sauce_id);
	}

}
