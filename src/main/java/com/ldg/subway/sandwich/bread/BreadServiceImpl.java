package com.ldg.subway.sandwich.bread;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("breadService")
public class BreadServiceImpl implements BreadService{

	@Autowired
	BreadDAO bDAO;
	
	
	@Override
	public List<BreadVO> getAllBread() throws Exception {
		return bDAO.getAllBread();
	}


	@Override
	public BreadVO getBreadById(String bread_id) throws Exception {
		return bDAO.getBreadById(bread_id);
	}
	
}
