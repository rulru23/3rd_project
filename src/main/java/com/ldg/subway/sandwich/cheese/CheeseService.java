package com.ldg.subway.sandwich.cheese;

import java.util.List;

public interface CheeseService {
	public List<CheeseVO> getAllCheese() throws Exception;
	public CheeseVO getCheeseById(String cheese_id) throws Exception;

}
