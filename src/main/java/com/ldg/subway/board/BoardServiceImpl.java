package com.ldg.subway.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDAO;
	
	@Override
	public List<BoardVO> getAllBoard(String content_type) throws Exception {
		if(content_type.equals("fast-sub")) {
			content_type="menu";
		}
		return bDAO.getAllBoard(content_type);
	}

	@Override
	public BoardVO getBoard(int board_id) throws Exception {
		return bDAO.getBoard(board_id);
	}

}
