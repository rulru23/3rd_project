package com.ldg.subway.sandwich.cheese;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CheeseDAO {
	public List<CheeseVO> getAllCheese();
	public CheeseVO getCheeseById(String cheese_id);
}
