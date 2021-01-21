package com.kh.ontact.project.task.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.task.model.dto.TaskDto;

@Repository("taskDao")
public class TaskDao {
	@Autowired
	private SqlSession sqlSession;
	public List<TaskDto> selectOne(BoardAllDto Bdto) { //글 가져오기
		return sqlSession.selectList("Task.selectOne" ,Bdto);
	}
	public int listCount(int to) {
		return sqlSession.selectOne("Task.listCount",to);
	}
	public List<TaskDto> PListTaskAll( HashMap<String, String> paramMap) throws Exception{
		return sqlSession.selectList("Task.PListTaskAll", paramMap);
	}
//	추가한거
	public int insertTask(TaskDto dto) throws Exception {
		return sqlSession.insert("Task.insertTask",dto);
	}
	public List<TaskDto> ListTaskAll(String pno) throws Exception{
		return sqlSession.selectList("Task.ListTaskAll", pno);
	}
	public int deleteTask(int bno) throws Exception{
		return sqlSession.delete("Task.deleteTask",bno);
	}
	public int taskStateUpdate01(int bno) throws Exception{
		return sqlSession.update("Task.taskStateUpdate01", bno);
	}
	public int taskStateUpdate02(int bno) throws Exception{
		return sqlSession.update("Task.taskStateUpdate02", bno);
	}
	public int taskStateUpdate03(int bno) throws Exception{
		return sqlSession.update("Task.taskStateUpdate03", bno);
	}
	public int taskStateUpdate04(int bno) throws Exception{
		return sqlSession.update("Task.taskStateUpdate04", bno);
	}
	public int trateUpdate00(int bno) throws Exception{
		return sqlSession.update("Task.trateUpdate00", bno);
	}
	public int trateUpdate20(int bno) throws Exception{
		return sqlSession.update("Task.trateUpdate20", bno);
	}
	public int trateUpdate40(int bno) throws Exception{
		return sqlSession.update("Task.trateUpdate40", bno);
	}
	public int trateUpdate60(int bno) throws Exception{
		return sqlSession.update("Task.trateUpdate60", bno);
	}
	public int trateUpdate80(int bno) throws Exception{
		return sqlSession.update("Task.trateUpdate80", bno);
	}
	public int trateUpdate100(int bno) throws Exception{
		return sqlSession.update("Task.trateUpdate100", bno);
	}
	public int tpriLv1(int bno) throws Exception{
		return sqlSession.update("Task.tpriLv1", bno);
	}
	public int tpriLv2(int bno) throws Exception{
		return sqlSession.update("Task.tpriLv2", bno);
	}
	public int tpriLv3(int bno) throws Exception{
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
	public List<Integer> taskStateList(String pno) throws Exception{
		return sqlSession.selectList("Task.taskStateList", pno);
	}
	

}
