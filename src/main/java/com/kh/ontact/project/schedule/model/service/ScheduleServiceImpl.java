package com.kh.ontact.project.schedule.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.schedule.model.dao.ScheduleDao;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;

@Service("scheduleServ")
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDao scheduleDao;

	@Override
	public int insertSchedule(ScheduleDto s) { // 글 입력 
		return scheduleDao.insertSchedule(s);
	}

	@Override
	public List<ScheduleDto> selectSche(HashMap<String, String> paramMap) {
		return scheduleDao.selectSche(paramMap);
	}

	@Override
	public List<ScheduleDto> selectTaskSche(HashMap<String, String> paramMap) {
		return scheduleDao.selectTaskSche(paramMap);
	}
}
