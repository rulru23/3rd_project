package com.ldg.subway.board;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("board/boardMain")
	public String getAllBoard(@RequestParam("content_type")String content_type, Model model) throws Exception {
		List<BoardVO> bList = boardService.getAllBoard(content_type);
		model.addAttribute("bList", bList);
		model.addAttribute("content_type", content_type);
		return "board/boardMain";
	}
	
	@RequestMapping("board/board")
	public String getBoard(@RequestParam("content_type")String content_type,BoardVO bVO, Model model) throws Exception {
		BoardVO board = boardService.getBoard(bVO.getBoard_id());
		model.addAttribute("board", board);
		model.addAttribute("content_type", content_type);
		return "board/board";
	}
	
}
