package com.kh.ontact.project.schedule.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.project.task.model.dto.TaskDto;

@Repository("scheduleDao")
public class ScheduleDao {
	@Autowired
	private SqlSession sqlSession;
	
//	프로젝트 일정 글 
	public int insertSchedule(ScheduleDto s) {  
		return sqlSession.insert("ScheduleMapper.insertSchedule",s);
	}
	//업데이트
	public List<ScheduleDto> selectOnlySchedule(ScheduleDto s) {  
		return sqlSession.selectList("ScheduleMapper.selectOnlySchedule",s);
	}
	public int insertUpdateSchedule(ScheduleDto s) { 
		System.out.println("sche 다오 업데이트기능을 하는 인서트 진입");
		return sqlSession.insert("ScheduleMapper.insertUpdateSchedule",s);
	}
	public int deleteUpdateSchedule(int bno) { 
		System.out.println("sche 다오 업데이트기능을 하는 인서트 진입");
		return sqlSession.insert("ScheduleMapper.deleteUpdateSchedule",bno);
	}
	public int updateSchedule(ScheduleDto s) { 
		System.out.println("sche 다오 업데이트 진입");
		return sqlSession.insert("ScheduleMapper.updateSchedule",s);
	}

	public List<ScheduleDto> ListScheduleAll(String pno) {  
		return sqlSession.selectList("ScheduleMapper.ListScheduleAll",pno);
	}
	
	
//	전체 일정
	public List<ScheduleDto> selectAllSche(String pno) {
		
//		System.out.println(paramMap.get("uname"));
		return sqlSession.selectList("ScheduleMapper.selectAllSche", pno);
	}
	public List<ScheduleDto> selectAllTask(String pno) {
		return sqlSession.selectList("ScheduleMapper.selectAllTask", pno);
	}
	
}
