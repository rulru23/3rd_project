package com.ldg.subway.sandwich.meat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("meatService")
public class MeatServiceImpl implements MeatService{
	@Autowired
	private MeatDAO mDAO;

	@Override
	public List<MeatVO> getAllMeat() throws Exception {
		return mDAO.getAllMeat();
	}

	@Override
	public MeatVO getMeatById(String meat_id) throws Exception {
		return mDAO.getMeatById(meat_id);
	}
	
	
}
