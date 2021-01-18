package com.kh.ontact.project.schedule.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.schedule.model.dao.ScheduleDao;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;

@Service("scheduleServ")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	BoardAllDao boardalldao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
//	Authentication authentication;
//	@Override
//	public int insertSchedule(ScheduleDto s) { // 글 입력 
//		return scheduleDao.insertSchedule(s);
//	}

	@Override
	public void insertSchedule(BoardAllDto alldto, ScheduleDto s, String attendee) throws Exception{
		boardalldao.insertBoardAllSchedule(alldto);
		if(attendee!=null) {
			String [] array = attendee.split(",");
			for(int i=0; i<array.length; i++ ) {
				attendee = array[i];
				System.out.println("서비스에서 값" + attendee);
				s.setAttendee(attendee);		
				scheduleDao.insertSchedule(s);	
			}
		} else {
			scheduleDao.insertSchedule(s);
		}
		
	}
	
	@Override
	public void selectOneSchedule(ScheduleDto s) {  
		 scheduleDao.selectOneSchedule(s);
	}
	@Override
	public int updateSchedule(ScheduleDto s) {  
		return scheduleDao.updateSchedule(s);
	}
	@Override
	public int deleteSchedule(int bno) { 
		return scheduleDao.deleteSchedule(bno);
	}
	
	@Override
	public List<ScheduleDto> ListScheduleAll(String pno) throws Exception{
		return scheduleDao.ListScheduleAll(pno);
	}
	
	@Override
	public List<ScheduleDto> selectAllSche(HashMap<String, String> paramMap1) {
		System.out.println("뿌려보자11" + paramMap1.get("uname"));
		System.out.println("뿌려보자11" + paramMap1.get("attendee"));
		return scheduleDao.selectAllSche(paramMap1);
	}
	
	@Override
	public List<ScheduleDto> selectAllTask(HashMap<String, String> paramMap2) {
		System.out.println("뿌려보자22" + paramMap2.get("uname"));
		System.out.println("뿌려보자22" + paramMap2.get("attendee"));
		return scheduleDao.selectAllTask(paramMap2);
	}
}
