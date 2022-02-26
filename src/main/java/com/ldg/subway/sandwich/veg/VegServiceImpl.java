package com.ldg.subway.sandwich.veg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("vegService")
public class VegServiceImpl implements VegService{
	
	@Autowired
	private VegDAO vDAO;
	
	
	@Override
	public List<VegVO> getAllVeg() throws Exception {
		
		return vDAO.getAllVeg();
	}


	@Override
	public VegVO getVegById(String veg_id) throws Exception {
		
		return vDAO.getVegById(veg_id);
	}
	
}
