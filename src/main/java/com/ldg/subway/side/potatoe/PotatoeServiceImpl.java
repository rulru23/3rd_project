package com.ldg.subway.side.potatoe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("potatoeService")
public class PotatoeServiceImpl implements PotatoeService{

	@Autowired
	private PotatoeDAO pDAO;
	
	@Override
	public List<PotatoeVO> getAllPotatoe() throws Exception {
		
		return pDAO.getAllPotatoe();
	}

	@Override
	public PotatoeVO getPotatoeById(String Potatoe_id) throws Exception {
		
		return pDAO.getPotatoeById(Potatoe_id);
	}

	
}
