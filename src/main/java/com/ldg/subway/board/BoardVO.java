package com.ldg.subway.board;

import lombok.Data;

@Data
public class BoardVO {
	private int board_id, board_view, board_price, board_qty;
	private String member_id, board_category, board_title, board_content, board_content_type;
	
	public BoardVO() {}
	
	public BoardVO(int board_id, int board_view, int board_price, int board_qty, String member_id,
			String board_category, String board_title, String board_content, String board_content_type) {
		//super();
		this.board_id = board_id;
		this.board_view = board_view;
		this.board_price = board_price;
		this.board_qty = board_qty;
		this.member_id = member_id;
		this.board_category = board_category;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_content_type = board_content_type;
	}

	
	
}
