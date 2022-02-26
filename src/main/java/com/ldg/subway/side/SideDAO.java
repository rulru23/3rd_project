package com.ldg.subway.side;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SideDAO {
	public int insertSide(SideVO sVO);
	public List<SideVO> getAllSideById(String payment_id);
	public int deleteSide(String side_id);
}
