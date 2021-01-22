package com.kh.ontact.project.schedule.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.core.Authentication;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;

public interface ScheduleService {
//	public int insertSchedule(ScheduleDto s);
	public	void insertSchedule(BoardAllDto alldto, ScheduleDto s, String attendee) throws Exception;
	
	public void selectOneSchedule(ScheduleDto s); 
	
	public void updateSchedule(ScheduleDto s, String attendee);
	
	public int deleteSchedule(int bno) ;
	
	public List<ScheduleDto> ListScheduleAll(String pno) throws Exception;

	public List<ScheduleDto> selectAllSche(HashMap<String, String> paramMap1);
	
	public List<ScheduleDto> selectAllTask(HashMap<String, String> paramMap2);
	
//	public List<ScheduleDto> selectAllSche(int[] valueChk); 
//
//	public List<ScheduleDto> selectAllTask(int[] valueChk);

}
