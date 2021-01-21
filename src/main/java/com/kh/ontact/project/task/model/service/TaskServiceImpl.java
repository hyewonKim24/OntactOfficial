package com.kh.ontact.project.task.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.alert.model.dao.AlertDao;
import com.kh.ontact.alert.model.dto.AlertDto;
import com.kh.ontact.alert.model.service.AlertService;
import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.files.model.dao.FilesDao;
import com.kh.ontact.project.files.model.dto.FilesDto;
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
	@Autowired
	FilesDao filesdao;
	@Override
	public List<TaskDto> selectOne(BoardAllDto Bdto) throws Exception {
		return taskDao.selectOne(Bdto);
	}
	@Override
	public List<TaskDto> PListPTaskAll(HashMap<String, String> paramMap)
			throws Exception {
		return taskDao.PListTaskAll(paramMap);
	}
	@Override
	public int listCount(int to) {
		return taskDao.listCount(to);
	}
	//업무 글 등록 + 알림 등록 
	@Override
	public int insertTask(FilesDto file, TaskDto tdto,BoardAllDto dto) throws Exception {
		int rs=0;
			rs=baDao.insertBoardAllTask(dto);
			rs+=taskDao.insertTask(tdto);
			System.out.println(rs+"보드올 인서트");
			System.out.println(rs+"개 insert 성공");
			
			//알림 기능 ( 나 제외한 프로젝트 멤버들에게 알림 추가 ) 
			ProjectMemberDto pmdto= new ProjectMemberDto();
			pmdto.setUno(dto.getUno());
			pmdto.setPno(dto.getPno());
			AlertDto adto = null;
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
			
			HashMap<String, String> paramMap = new HashMap<String, String>();
			int listsize = file.getFilelist().size();
			System.out.println(listsize);
			//파일이 있다면
			if(listsize!=0) {
				int result = 0;
				for(int i=0; i<listsize; i++) {
					paramMap.put("pno", dto.getPno());
					paramMap.put("uno", dto.getUno());
					paramMap.put("fname", file.getFilelist().get(i).getFname());
					paramMap.put("fsize", file.getFilelist().get(i).getFsize());
					paramMap.put("fpath", file.getFilelist().get(i).getFpath());
					paramMap.put("imgsrc", file.getFilelist().get(i).getImgsrc());
					paramMap.put("foriginalname", file.getFilelist().get(i).getForiginalname());
					System.out.println("맵"+paramMap);
					result += filesdao.addFile(paramMap);
				}
				System.out.println(result+"행 파일이 추가되었습니다.");
			}
			//파일이 있다면
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
