package com.ldg.subway.side.beverage;

import java.util.List;

public interface BeverageService {
	public List<BeverageVO> getAllBeverage() throws Exception;
	public BeverageVO getBeverageById(String Beverage_id) throws Exception;
	

}
