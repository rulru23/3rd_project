package com.ldg.subway.sandwich.veg;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VegDAO {
	public List<VegVO> getAllVeg();
	public VegVO getVegById(String veg_id);
}
