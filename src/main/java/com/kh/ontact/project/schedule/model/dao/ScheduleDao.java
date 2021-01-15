package com.kh.ontact.project.schedule.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.schedule.model.dto.ScheduleDto;

@Repository("scheduleDao")
public class ScheduleDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertSchedule(ScheduleDto s) { // 글 입력 
		return sqlSession.insert("ScheduleMapper.insertSchedule",s);
	}
	
	public List<ScheduleDto> selectSche(HashMap<String, String> paramMap) {
		System.out.println("sche 다오까지 왔는데,,111");
		return sqlSession.selectList("ScheduleMapper.selectSche", paramMap);
	}
	public List<ScheduleDto> selectTaskSche(HashMap<String, String> paramMap) {
		System.out.println("sche 다오까지 왔는데,,222");
		return sqlSession.selectList("ScheduleMapper.selectTaskSche", paramMap);
	}
	
}
