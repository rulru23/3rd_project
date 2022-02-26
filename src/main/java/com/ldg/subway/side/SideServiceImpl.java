package com.ldg.subway.side;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("sideService")
public class SideServiceImpl implements SideService{

	@Autowired
	private SideDAO sDAO;
	
	@Override
	public int insertSide(SideVO sVO) throws Exception {
		
		return sDAO.insertSide(sVO);
	}

	@Override
	public List<SideVO> getAllSideById(String payment_id) throws Exception {
		
		return sDAO.getAllSideById(payment_id);
	}

	@Override
	public int deleteSide(String side_id) throws Exception {
		
		return sDAO.deleteSide(side_id);
	}

}
