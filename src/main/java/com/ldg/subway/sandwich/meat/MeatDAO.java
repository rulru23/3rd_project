package com.ldg.subway.sandwich.meat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MeatDAO {
	public List<MeatVO> getAllMeat();
	public MeatVO getMeatById(String meat_id);
}
