package com.kh.ontact.project.schedule.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;

public interface ScheduleService {
//	public int insertSchedule(ScheduleDto s);
	public	void insertSchedule(BoardAllDto alldto, ScheduleDto s) throws Exception;
	
	public void selectOneSchedule(ScheduleDto s); 
	
	public int updateSchedule(ScheduleDto s);
	
	public int deleteSchedule(String bno) ;
	
	public List<ScheduleDto> selectAllSche(HashMap<String, String> paramMap);

	public List<ScheduleDto> selectAllTask(HashMap<String, String> paramMap);

}
