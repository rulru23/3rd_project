package com.ldg.subway.sandwich.meat;

import java.util.List;

public interface MeatService {
	public List<MeatVO> getAllMeat() throws Exception;
	public MeatVO getMeatById(String meat_id) throws Exception;
}
