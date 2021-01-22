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
	public void selectOneSchedule(ScheduleDto s) {  
		sqlSession.insert("ScheduleMapper.selectOneSchedule",s);
	}
	
	public int updateSchedule(ScheduleDto s) { 
		System.out.println("sche 다오 업데이트 진입");
		return sqlSession.insert("ScheduleMapper.updateSchedule",s);
	}
	public int deleteSchedule(int bno) {  
		return sqlSession.insert("ScheduleMapper.deleteSchedule",bno);
	}
	public List<ScheduleDto> ListScheduleAll(String pno) throws Exception{
		return sqlSession.selectList("ScheduleMapper.ListScheduleAll", pno);
	}
	
	
//	전체 일정
	public List<ScheduleDto> selectAllSche(HashMap<String, String> paramMap1) {
		
//		System.out.println(paramMap.get("uname"));
		return sqlSession.selectList("ScheduleMapper.selectAllSche", paramMap1);
	}
	public List<ScheduleDto> selectAllTask(HashMap<String, String> paramMap2) {
		return sqlSession.selectList("ScheduleMapper.selectAllTask", paramMap2);
	}
	
}
