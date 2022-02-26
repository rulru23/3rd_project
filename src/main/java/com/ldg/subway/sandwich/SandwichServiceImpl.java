package com.ldg.subway.sandwich;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("sandwichService")
public class SandwichServiceImpl implements SandwichService {

	@Autowired
	private SandwichDAO sDAO;
	
	@Override
	public int insertSandwich(HashMap<String, String> map) throws Exception {
		return sDAO.insertSandwich(map);
	}

	@Override
	public List<SandwichVO> getAllSandwichByid(String paymnet_id) throws Exception {
		System.out.println(sDAO.getAllSandwichByid(paymnet_id));
		return sDAO.getAllSandwichByid(paymnet_id);
	}

	@Override
	public int deleteSand(String sandwich_id) throws Exception {
		return sDAO.deleteSandwich(sandwich_id);
	}

}
