package com.kh.ontact.project.task.model.service;

import java.util.List;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.task.model.dto.TaskDto;

public interface TaskService {

	int insertTask(TaskDto tdto,BoardAllDto dto) throws Exception;
	List<TaskDto> ListTaskAll(String pno) throws Exception;
	int deleteTask(String bno) throws Exception;
	
	int taskStateUpdate01(String bno) throws Exception;
	int taskStateUpdate02(String bno) throws Exception;
	int taskStateUpdate03(String bno) throws Exception;
	int taskStateUpdate04(String bno) throws Exception;
	
	int trateUpdate00(String bno) throws Exception;
	int trateUpdate20(String bno) throws Exception;
	int trateUpdate40(String bno) throws Exception;
	int trateUpdate60(String bno) throws Exception;
	int trateUpdate80(String bno) throws Exception;
	int trateUpdate100(String bno) throws Exception;
	
	int tpriLv1(String bno) throws Exception;
	int tpriLv2(String bno) throws Exception;
	int tpriLv3(String bno) throws Exception;
	
	int tResUpdate(TaskDto dto) throws Exception;
	
	int tstartUpdate(TaskDto dto) throws Exception;
	int tendUpdate(TaskDto dto) throws Exception;
}
