package com.kh.ontact.project.task.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.alert.model.dao.AlertDao;
import com.kh.ontact.alert.model.dto.AlertDto;
import com.kh.ontact.alert.model.service.AlertService;
import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.reply.model.dao.ReplyDao;
import com.kh.ontact.project.task.model.dao.TaskDao;
import com.kh.ontact.project.task.model.dto.TaskDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.projectMember.model.service.ProjectMemberService;

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
	@Autowired
	ProjectMemberService pmService;
	@Autowired
	AlertService alertService;
	
	@Override
	public int insertTask(TaskDto tdto,BoardAllDto dto) throws Exception {
		int rs=0;
			rs=baDao.insertBoardAllTask(dto);
			rs+=taskDao.insertTask(tdto);
			System.out.println(rs+"보드올 인서트");
			System.out.println(rs+"개 insert 성공");
			
			ProjectMemberDto pmdto= new ProjectMemberDto();
			AlertDto adto = null;
			pmdto.setUno(dto.getUno());
			pmdto.setPno(dto.getPno());
			//알림 기능하게되면 나 제외한 다른 사람들에게 알림추가
			List<String> plist =pmService.AlertProList(pmdto);
			System.out.println("프로젝트 리스트:"+plist);
			for(int i=0;i<plist.size();i++) {
				adto = new AlertDto();
				adto.setUno(plist.get(i));
				adto.setPno(dto.getPno());
				adto.setAcontent(dto.getUname()+"님이 ["+dto.getBname()+"]글을 1개 등록했습니다.");
				int ars = alertService.alertInsert(adto);
				System.out.println(ars+"개 알림등록");
			}
		return rs;
	}

	@Override
	public List<TaskDto> ListTaskAll(String pno) throws Exception {
		return taskDao.ListTaskAll(pno);
	}

	@Override
	public int deleteTask(int bno) throws Exception {
		System.out.println("글삭제 서비스 접근");
			int rs=baDao.deleteBoardall(bno);
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
