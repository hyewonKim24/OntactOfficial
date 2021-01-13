package com.kh.ontact.project.task.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.task.model.dao.TaskDao;
import com.kh.ontact.project.task.model.dto.TaskDto;

@Service("taskService")
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	TaskDao taskDao;
	@Autowired
	BoardAllDao baDao;
	
	@Override
	public int insertTask(TaskDto tdto,BoardAllDto dto) throws Exception {
		int rs=0;
			rs=baDao.insertBoardAllTask(dto);
			rs+=taskDao.insertTask(tdto);
			System.out.println(rs+"보드올 인서트");
			System.out.println(rs+"개 insert 성공");
		return rs;
	}

	@Override
	public List<TaskDto> ListTaskAll(String pno) throws Exception {
		return taskDao.ListTaskAll(pno);
	}

	@Override
	public int deleteTask(String bno) throws Exception {
		int rs=0;
			rs=taskDao.deleteTask(bno);
			rs+=baDao.deleteBoardall(bno);
		return rs;
	}

	@Override
	public int taskStateUpdate01(String bno) throws Exception {
		return taskDao.taskStateUpdate01(bno);
	}

	@Override
	public int taskStateUpdate02(String bno) throws Exception {
		return taskDao.taskStateUpdate02(bno);
	}

	@Override
	public int taskStateUpdate03(String bno) throws Exception {
		return taskDao.taskStateUpdate03(bno);
	}

	@Override
	public int taskStateUpdate04(String bno) throws Exception {
		return taskDao.taskStateUpdate04(bno);
	}

	@Override
	public int trateUpdate00(String bno) throws Exception {
		return taskDao.trateUpdate00(bno);
	}

	@Override
	public int trateUpdate20(String bno) throws Exception {
		return taskDao.trateUpdate20(bno);
	}

	@Override
	public int trateUpdate40(String bno) throws Exception {
		return taskDao.trateUpdate40(bno);
	}

	@Override
	public int trateUpdate60(String bno) throws Exception {
		return taskDao.trateUpdate60(bno);
	}

	@Override
	public int trateUpdate80(String bno) throws Exception {
		return taskDao.trateUpdate80(bno);
	}

	@Override
	public int trateUpdate100(String bno) throws Exception {
		return taskDao.trateUpdate100(bno);
	}

	@Override
	public int tpriLv1(String bno) throws Exception {
		return taskDao.tpriLv1(bno);
	}

	@Override
	public int tpriLv2(String bno) throws Exception {
		return taskDao.tpriLv2(bno);
	}

	@Override
	public int tpriLv3(String bno) throws Exception {
		return taskDao.tpriLv3(bno);
	}

	@Override
	public int tResUpdate(TaskDto dto) throws Exception {
		return taskDao.tResUpdate(dto);
	}

	@Override
	public int tstartUpdate(TaskDto dto) throws Exception {
		return taskDao.tstartUpdate(dto);
	}

	@Override
	public int tendUpdate(TaskDto dto) throws Exception {
		return taskDao.tendUpdate(dto);
	}
	
	
}
