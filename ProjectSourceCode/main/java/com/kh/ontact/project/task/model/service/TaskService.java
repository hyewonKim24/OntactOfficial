package com.kh.ontact.project.task.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.files.model.dto.FilesDto;
import com.kh.ontact.project.task.model.dto.TaskDto;

public interface TaskService {
	//업무리스트
	List<TaskDto> PListTaskAll(String pno) throws Exception;
	List<TaskDto> PListTaskMy(HashMap<String, String> paramMap) throws Exception;
	List<TaskDto> PListTaskRequire(HashMap<String, String> paramMap) throws Exception;
	//혜원
	List<TaskDto> selectOne(BoardAllDto Bdto) throws Exception;
	public int listCount(int to);
	public int insertTask(FilesDto file, TaskDto tdto,BoardAllDto dto) throws Exception;
	List<TaskDto> ListTaskAll(String pno) throws Exception;
	int deleteTask(int bno) throws Exception;
	
	int taskStateUpdate01(int bno) throws Exception;
	int taskStateUpdate02(int bno) throws Exception;
	int taskStateUpdate03(int bno) throws Exception;
	int taskStateUpdate04(int bno) throws Exception;
	
	int trateUpdate00(int bno) throws Exception;
	int trateUpdate20(int bno) throws Exception;
	int trateUpdate40(int bno) throws Exception;
	int trateUpdate60(int bno) throws Exception;
	int trateUpdate80(int bno) throws Exception;
	int trateUpdate100(int bno) throws Exception;
	
	int tpriLv1(int bno) throws Exception;
	int tpriLv2(int bno) throws Exception;
	int tpriLv3(int bno) throws Exception;
	
	int tResUpdate(TaskDto dto) throws Exception;
	
	int tstartUpdate(TaskDto dto) throws Exception;
	int tendUpdate(TaskDto dto) throws Exception;
	
	List<Integer> taskStateList(String pno) throws Exception;
}
