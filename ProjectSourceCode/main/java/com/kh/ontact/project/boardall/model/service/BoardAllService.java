package com.kh.ontact.project.boardall.model.service;

import java.util.List;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllViewDto;
import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.project.task.model.dto.TaskDto;
import com.kh.ontact.project.todo.model.dto.TodoViewDto;

public interface BoardAllService {
	List<BoardAllDto> ListTaskBoardAll(String pno) throws Exception;
	
	// Proejct Detail 전체 리스트
	public List<BoardAllViewDto> selectListPjDetail(String pno) throws Exception;
	public List<CommonboardDto> getCommonboard() throws Exception;
	public List<TaskDto> getTask() throws Exception;
	public List<ScheduleDto> getSchedule() throws Exception;
	public List<TodoViewDto> getTodo() throws Exception;

}
