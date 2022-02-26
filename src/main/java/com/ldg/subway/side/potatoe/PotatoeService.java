package com.ldg.subway.side.potatoe;

import java.util.List;

public interface PotatoeService {
	public List<PotatoeVO> getAllPotatoe() throws Exception;
	public PotatoeVO getPotatoeById(String Potatoe_id) throws Exception;
}
