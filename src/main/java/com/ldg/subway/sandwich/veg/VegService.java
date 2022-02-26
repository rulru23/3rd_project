package com.ldg.subway.sandwich.veg;

import java.util.List;

public interface VegService {
	public List<VegVO> getAllVeg() throws Exception;
	public VegVO getVegById(String veg_id) throws Exception;

}
