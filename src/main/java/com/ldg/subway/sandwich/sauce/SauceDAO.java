package com.ldg.subway.sandwich.sauce;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SauceDAO {
	public List<SauceVO> getAllSauce();
	public SauceVO getSauceById(String sauce_id);
}
