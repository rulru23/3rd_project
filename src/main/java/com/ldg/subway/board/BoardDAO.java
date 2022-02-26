package com.ldg.subway.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {

	public List<BoardVO> getAllBoard(String content_type) throws Exception;
	public BoardVO getBoard(int board_id) throws Exception;
	
}
