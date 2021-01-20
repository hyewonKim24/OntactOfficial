package com.kh.ontact.project.boardall.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllViewDto;
import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.project.task.model.dto.TaskDto;
import com.kh.ontact.project.todo.model.dto.TodoViewDto;

@Repository("baDao")
public class BoardAllDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int deleteBoardall(int bno) throws Exception{
		return sqlSession.delete("BoardAll.deleteBoardall", bno);
	}
	
	public List<BoardAllDto> ListTaskBoardAll(String pno) throws Exception{
		return sqlSession.selectList("BoardAll.ListTaskBoardAll"
				+ "", pno);
	}
	
//	Boardall insert (업무:혜원 / 일정:혜림 / 할일: 윤진)
	public int insertBoardAllTask(BoardAllDto dto) throws Exception {
		return sqlSession.insert("BoardAll.insertBoardAllTask",dto);
	}
	
	public int insertBoardAllSchedule(BoardAllDto dto) throws Exception {
		return sqlSession.insert("BoardAll.insertBoardAllSchedule",dto);
	}
	public int insertBoardAllTodo(BoardAllDto dto) throws Exception {
		return sqlSession.insert("BoardAll.insertBoardAllTodo", dto);
	}

	
	public List<BoardAllViewDto> selectListPjDetail(String pno) throws Exception {
		return sqlSession.selectList("BoardAllView.selectListPjDetail", pno);
	}
	
	public List<CommonboardDto> getCommonboard() throws Exception{
		return sqlSession.selectList("BoardAllView.getCommonboard");
	}
	
	public List<TaskDto> getTask() throws Exception{
		return sqlSession.selectList("BoardAllView.getTask");
	}
	public List<ScheduleDto> getSchedule() throws Exception{
		return sqlSession.selectList("BoardAllView.getSchedule");
	}
	
	public List<TodoViewDto> getTodo() throws Exception{
		return sqlSession.selectList("BoardAllView.getTodo");
	}
	
}
