package com.ldg.subway.sandwich;

import java.util.HashMap;
import java.util.List;

public interface SandwichService {
	public int insertSandwich(HashMap<String, String> map) throws Exception;
	public List<SandwichVO> getAllSandwichByid(String paymnet_id) throws Exception;
	public int deleteSand(String sandwich_id) throws Exception;
}
