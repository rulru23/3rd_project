package com.ldg.subway.side.potatoe;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PotatoeDAO {
	public List<PotatoeVO> getAllPotatoe();
	public PotatoeVO getPotatoeById(String Potatoe_id);
}
