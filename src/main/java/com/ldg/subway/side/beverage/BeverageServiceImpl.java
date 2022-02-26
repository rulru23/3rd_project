package com.ldg.subway.side.beverage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("beverageService")
public class BeverageServiceImpl implements BeverageService {

	@Autowired
	private BeverageDAO bDAO;
	
	@Override
	public List<BeverageVO> getAllBeverage() throws Exception {
		
		return bDAO.getAllBeverage();
	}

	@Override
	public BeverageVO getBeverageById(String Beverage_id) throws Exception {
		
		return bDAO.getBeverageById(Beverage_id);
	}

}
