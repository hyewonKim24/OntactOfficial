package com.kh.ontact.project.schedule.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.alert.model.dto.AlertDto;
import com.kh.ontact.alert.model.service.AlertService;
import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.schedule.model.dao.ScheduleDao;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.projectMember.model.service.ProjectMemberService;

@Service("scheduleServ")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	BoardAllDao boardalldao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	//혜원 알림기능 추가
	@Autowired
	ProjectMemberService pmService;
	@Autowired
	AlertService alertService;
	
//	Authentication authentication;
//	@Override
//	public int insertSchedule(ScheduleDto s) { // 글 입력 
//		return scheduleDao.insertSchedule(s);
//	}

	@Override
	public void insertSchedule(BoardAllDto alldto, ScheduleDto s, String attendee) throws Exception{
		boardalldao.insertBoardAllSchedule(alldto);
		if(attendee!=null) {
			String [] array = attendee.split(",");
			for(int i=0; i<array.length; i++ ) {
				attendee = array[i];
				System.out.println("서비스에서 값" + attendee);
				s.setAttendee(attendee);		
				scheduleDao.insertSchedule(s);	
			}
		} else {
			scheduleDao.insertSchedule(s);
		}
		//알림 기능 ( 나 제외한 프로젝트 멤버들에게 알림 추가 ) 
		 ProjectMemberDto pmdto= new ProjectMemberDto();
		 pmdto.setUno(alldto.getUno());
		 pmdto.setPno(alldto.getPno());
		 AlertDto adto = null;
		 List<String> plist =pmService.AlertProList(pmdto);
		 System.out.println("프로젝트 리스트:"+plist);
		 int ars = 0;
		 for(int i=0;i<plist.size();i++) {
			 adto = new AlertDto();
			 adto.setUno(plist.get(i));
			 adto.setPno(alldto.getPno());
			 adto.setAcontent(alldto.getUname()+"님이 ["+alldto.getBname()+"]글을 1개 등록했습니다.");
			 ars += alertService.alertInsert(adto);
		 }
		 System.out.println("일정"+ars+"개 알림등록");
		 //혜원 끝
		
	}
	//
	@Override
	public void selectOneSchedule(ScheduleDto s) {  
		 //scheduleDao.selectOneSchedule(s);
	}
	@Override
	public void updateSchedule(ScheduleDto s, String attendee) {  
		
		
		List<ScheduleDto> sTemp = scheduleDao.selectOnlySchedule(s);
		System.out.println("one에서가지고 나온애들" + sTemp.get(0));
		
		scheduleDao.deleteUpdateSchedule(s.getBno());
		
		if(attendee!=null) {
			String [] array = attendee.split(",");
			for(int i=0; i<array.length; i++ ) {
				attendee = array[i];
				System.out.println("서비스에서 값" + attendee);
				sTemp.get(0).setAttendee(attendee);
				System.out.println("attendee: "+ attendee);
				scheduleDao.insertUpdateSchedule(sTemp.get(0));	
			}
		} else {
			System.out.println("attendee: "+ "없다");
			scheduleDao.insertUpdateSchedule(sTemp.get(0));
		}
		
	}
	@Override
	public int deleteSchedule(int bno) { 
		return scheduleDao.deleteUpdateSchedule(bno);
	}
	
	@Override
	public List<ScheduleDto> ListScheduleAll(String pno) throws Exception{
		return scheduleDao.ListScheduleAll(pno);
	}
	
	@Override
	public List<ScheduleDto> selectAllSche(String pno) {
		
		return scheduleDao.selectAllSche(pno);
	}
	
	@Override
	public List<ScheduleDto> selectAllTask(String pno) {
		
		return scheduleDao.selectAllTask(pno);
	}
}
