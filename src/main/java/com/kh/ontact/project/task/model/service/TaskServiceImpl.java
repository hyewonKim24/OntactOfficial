package com.kh.ontact.project.task.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.alert.model.dao.AlertDao;
import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.reply.model.dao.ReplyDao;
import com.kh.ontact.project.task.model.dao.TaskDao;
import com.kh.ontact.project.task.model.dto.TaskDto;

@Service("taskService")
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	TaskDao taskDao;
	@Autowired
	BoardAllDao baDao;
	@Autowired
	AlertDao alertDao;
	@Autowired
	ReplyDao rpDao;
	
	@Override
	public int insertTask(TaskDto tdto,BoardAllDto dto) throws Exception {
		int rs=0;
			rs=baDao.insertBoardAllTask(dto);
			rs+=taskDao.insertTask(tdto);
			rs+=alertDao.alertInsert(dto);
			System.out.println(rs+"보드올 인서트");
			System.out.println(rs+"개 insert 성공");
		return rs;
	}

	@Override
	public List<TaskDto> ListTaskAll(String pno) throws Exception {
		return taskDao.ListTaskAll(pno);
	}

	@Override
	public int deleteTask(int bno) throws Exception {
		System.out.println("글삭제 서비스 접근");
		int rs=rpDao.deleteReplyAll(bno); 
			System.out.println(rs+"댓글삭제");
			rs+=alertDao.deleteAll(bno);
			System.out.println(rs+"알림삭제");
			 rs+=taskDao.deleteTask(bno);
			rs+=baDao.deleteBoardall(bno);
			System.out.println(rs+"글삭제");
		return rs;
	}

	@Override
	public int taskStateUpdate01(int bno) throws Exception {
		return taskDao.taskStateUpdate01(bno);
	}

	@Override
	public int taskStateUpdate02(int bno) throws Exception {
		return taskDao.taskStateUpdate02(bno);
	}

	@Override
	public int taskStateUpdate03(int bno) throws Exception {
		return taskDao.taskStateUpdate03(bno);
	}

	@Override
	public int taskStateUpdate04(int bno) throws Exception {
		return taskDao.taskStateUpdate04(bno);
	}

	@Override
	public int trateUpdate00(int bno) throws Exception {
		return taskDao.trateUpdate00(bno);
	}

	@Override
	public int trateUpdate20(int bno) throws Exception {
		return taskDao.trateUpdate20(bno);
	}

	@Override
	public int trateUpdate40(int bno) throws Exception {
		return taskDao.trateUpdate40(bno);
	}

	@Override
	public int trateUpdate60(int bno) throws Exception {
		return taskDao.trateUpdate60(bno);
	}

	@Override
	public int trateUpdate80(int bno) throws Exception {
		return taskDao.trateUpdate80(bno);
	}

	@Override
	public int trateUpdate100(int bno) throws Exception {
		return taskDao.trateUpdate100(bno);
	}

	@Override
	public int tpriLv1(int bno) throws Exception {
		return taskDao.tpriLv1(bno);
	}

	@Override
	public int tpriLv2(int bno) throws Exception {
		return taskDao.tpriLv2(bno);
	}

	@Override
	public int tpriLv3(int bno) throws Exception {
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

	@Override
	public List<Integer> taskStateList(String pno) throws Exception {
		return taskDao.taskStateList(pno);
	}
	
	
}
