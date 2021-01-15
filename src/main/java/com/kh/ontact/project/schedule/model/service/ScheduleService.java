package com.kh.ontact.project.schedule.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.ontact.project.schedule.model.dto.ScheduleDto;

public interface ScheduleService {
	public int insertSchedule(ScheduleDto s);
	
	public List<ScheduleDto> selectSche(HashMap<String, String> paramMap);
	public List<ScheduleDto> selectTaskSche(HashMap<String, String> paramMap);
}
