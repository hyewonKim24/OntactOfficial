package com.kh.ontact.dayoff.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.ontact.dayoff.model.dto.DayoffDto;

public interface DayoffService {
	
	public int allListCount();
	
	public List<DayoffDto> selectDayoff(int startPage, int limit);
	
	public List<DayoffDto> searchDayoff(HashMap<String, String> paramMap);
	
	public DayoffDto selectDfOne(String dfno);
	
	public int insertDayoff(DayoffDto d); 
	
	public DayoffDto updateDayoffApp(DayoffDto d); 

}
