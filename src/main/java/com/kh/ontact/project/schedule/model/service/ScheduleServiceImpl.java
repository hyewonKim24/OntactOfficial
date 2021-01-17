package com.kh.ontact.project.schedule.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.files.model.dto.FilesDto;
import com.kh.ontact.project.schedule.model.dao.ScheduleDao;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;

@Service("scheduleServ")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	BoardAllDao boardalldao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
//	@Override
//	public int insertSchedule(ScheduleDto s) { // 글 입력 
//		return scheduleDao.insertSchedule(s);
//	}

	@Override
	public void insertSchedule(BoardAllDto alldto, ScheduleDto s) throws Exception{
		boardalldao.insertBoardAllSchedule(alldto);
		scheduleDao.insertSchedule(s);
	}
	
	@Override
	public void selectOneSchedule(ScheduleDto s) { // 글 입력 
		 scheduleDao.selectOneSchedule(s);
	}
	@Override
	public int updateSchedule(ScheduleDto s) { // 글 입력 
		return scheduleDao.updateSchedule(s);
	}
	@Override
	public int deleteSchedule(String bno) { // 글 입력 
		return scheduleDao.deleteSchedule(bno);
	}
	
	@Override
	public List<ScheduleDto> selectAllSche(HashMap<String, String> paramMap) {
		return scheduleDao.selectAllSche(paramMap);
	}
	
	@Override
	public List<ScheduleDto> selectAllTask(HashMap<String, String> paramMap) {
		return scheduleDao.selectAllTask(paramMap);
	}
}
