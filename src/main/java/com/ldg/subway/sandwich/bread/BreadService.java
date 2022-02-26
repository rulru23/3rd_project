package com.ldg.subway.sandwich.bread;

import java.util.List;

public interface BreadService {
	public List<BreadVO> getAllBread() throws Exception;
	public BreadVO getBreadById(String bread_id) throws Exception;
}
