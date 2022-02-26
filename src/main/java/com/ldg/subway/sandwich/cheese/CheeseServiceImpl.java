package com.ldg.subway.sandwich.cheese;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cheeseService")
public class CheeseServiceImpl implements CheeseService {

	@Autowired
	private CheeseDAO cDAO;
	
	@Override
	public List<CheeseVO> getAllCheese() throws Exception {
		return cDAO.getAllCheese();
	}

	@Override
	public CheeseVO getCheeseById(String cheese_id) throws Exception {
		
		return cDAO.getCheeseById(cheese_id);
	}

}
