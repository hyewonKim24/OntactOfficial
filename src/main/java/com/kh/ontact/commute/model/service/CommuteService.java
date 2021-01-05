package com.kh.ontact.commute.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.ontact.commute.model.dto.CommuteDto;

public interface CommuteService {
	public int allListCount();
	
	public List<CommuteDto> selectDailyCommute(int startPage, int limit);
	
	public int listCount();
	
	public List<CommuteDto> searchDailyCommute(HashMap<String, String> paramMap);

	public int monthListCount();
	
	public List<CommuteDto> searchMonthCommute(HashMap<String, String> paramMap);
	
	public int insertEnter(CommuteDto c);

	public int updateLeave(CommuteDto c); 
 
}
