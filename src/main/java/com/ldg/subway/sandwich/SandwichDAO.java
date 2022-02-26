package com.ldg.subway.sandwich;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SandwichDAO {
	public int insertSandwich(HashMap<String, String> map);
	public List<SandwichVO> getAllSandwichByid(String paymnet_id);
	public int deleteSandwich(String sandwich_id);
}
