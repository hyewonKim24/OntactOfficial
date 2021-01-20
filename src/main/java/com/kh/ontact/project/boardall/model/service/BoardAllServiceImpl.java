package com.kh.ontact.project.boardall.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllViewDto;
import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.project.task.model.dto.TaskDto;
import com.kh.ontact.project.todo.model.dto.TodoViewDto;

@Service("baService")
public class BoardAllServiceImpl implements BoardAllService{
	@Autowired
	private BoardAllDao baDao;
	@Override
	public List<BoardAllDto> ListTaskBoardAll(String pno) throws Exception {
		return baDao.ListTaskBoardAll(pno);
	}
	@Override
	public List<BoardAllViewDto> selectListPjDetail(String pno) throws Exception {
		return baDao.selectListPjDetail(pno);
	}
	@Override
	public List<CommonboardDto> getCommonboard() throws Exception {
		return baDao.getCommonboard();
	}
	@Override
	public List<TaskDto> getTask() throws Exception {
		return baDao.getTask();
	}
	@Override
	public List<ScheduleDto> getSchedule() throws Exception {
		return baDao.getSchedule();
	}
	@Override
	public List<TodoViewDto> getTodo() throws Exception {
		return baDao.getTodo();
	}
}
