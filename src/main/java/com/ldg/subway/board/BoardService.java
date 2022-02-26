package com.ldg.subway.board;

import java.util.List;

public interface BoardService {
	public List<BoardVO> getAllBoard(String content_type) throws Exception;
	public BoardVO getBoard(int board_id) throws Exception;

}
