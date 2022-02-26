package com.ldg.subway.side.beverage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BeverageDAO {
	public List<BeverageVO> getAllBeverage();
	public BeverageVO getBeverageById(String Beverage_id);
}
