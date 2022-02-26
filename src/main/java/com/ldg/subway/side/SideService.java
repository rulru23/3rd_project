package com.ldg.subway.side;

import java.util.List;

public interface SideService {
	public int insertSide(SideVO sVO) throws Exception;
	public List<SideVO> getAllSideById(String payment_id) throws Exception;
	public int deleteSide(String side_id) throws Exception;
}
