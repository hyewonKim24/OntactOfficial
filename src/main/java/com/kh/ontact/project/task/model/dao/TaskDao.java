package com.kh.ontact.project.task.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.task.model.dto.TaskDto;

@Repository("taskDao")
public class TaskDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertTask(TaskDto dto) throws Exception {
		return sqlSession.insert("Task.insertTask",dto);
	}
	public List<TaskDto> ListTaskAll(String pno) throws Exception{
		return sqlSession.selectList("Task.ListTaskAll", pno);
	}
	public int deleteTask(String bno) throws Exception{
		return sqlSession.delete("Task.deleteTask",bno);
	}
	public int taskStateUpdate01(String bno) throws Exception{
		return sqlSession.update("Task.taskStateUpdate01", bno);
	}
	public int taskStateUpdate02(String bno) throws Exception{
		return sqlSession.update("Task.taskStateUpdate02", bno);
	}
	public int taskStateUpdate03(String bno) throws Exception{
		return sqlSession.update("Task.taskStateUpdate03", bno);
	}
	public int taskStateUpdate04(String bno) throws Exception{
		return sqlSession.update("Task.taskStateUpdate04", bno);
	}
	public int trateUpdate00(String bno) throws Exception{
		return sqlSession.update("Task.trateUpdate00", bno);
	}
	public int trateUpdate20(String bno) throws Exception{
		return sqlSession.update("Task.trateUpdate20", bno);
	}
	public int trateUpdate40(String bno) throws Exception{
		return sqlSession.update("Task.trateUpdate40", bno);
	}
	public int trateUpdate60(String bno) throws Exception{
		return sqlSession.update("Task.trateUpdate60", bno);
	}
	public int trateUpdate80(String bno) throws Exception{
		return sqlSession.update("Task.trateUpdate80", bno);
	}
	public int trateUpdate100(String bno) throws Exception{
		return sqlSession.update("Task.trateUpdate100", bno);
	}
	public int tpriLv1(String bno) throws Exception{
		return sqlSession.update("Task.tpriLv1", bno);
	}
	public int tpriLv2(String bno) throws Exception{
		return sqlSession.update("Task.tpriLv2", bno);
	}
	public int tpriLv3(String bno) throws Exception{
		return sqlSession.update("Task.tpriLv3", bno);
	}
	public int tResUpdate(TaskDto dto) throws Exception{
		return sqlSession.update("Task.tResUpdate", dto);
	}
	public int tstartUpdate(TaskDto dto) throws Exception{
		return sqlSession.update("Task.tstartUpdate", dto);
	}
	public int tendUpdate(TaskDto dto) throws Exception{
		return sqlSession.update("Task.tendUpdate", dto);
	}
	

}
