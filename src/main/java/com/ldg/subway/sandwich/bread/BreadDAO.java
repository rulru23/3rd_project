package com.ldg.subway.sandwich.bread;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BreadDAO {
	public List<BreadVO> getAllBread();
	public BreadVO getBreadById(String bread_id);
}

