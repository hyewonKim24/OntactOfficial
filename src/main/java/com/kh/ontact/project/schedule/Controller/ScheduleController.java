package com.kh.ontact.project.schedule.Controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.ListUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.ontact.alert.model.dto.AlertDto;
import com.kh.ontact.alert.model.service.AlertService;
import com.kh.ontact.dayoff.model.dto.DayoffDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.boardall.model.service.BoardAllService;
import com.kh.ontact.project.reply.model.dto.ReplyDto;
import com.kh.ontact.project.reply.model.service.ReplyService;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.project.schedule.model.service.ScheduleService;
import com.kh.ontact.project.task.model.dto.TaskDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.projectMember.model.service.ProjectMemberService;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.model.service.UsersService;

@Controller
public class ScheduleController {
	
	@Autowired
	ScheduleService scheduleServ;
	@Autowired
	ReplyService replyService;
	@Autowired
	BoardAllService baService;
	@Autowired
	UsersService usersService;

	
	//스케줄 디테일로 들어가기
	@RequestMapping(value="/scheduleboard" ,method=RequestMethod.GET)
	public ModelAndView main(ModelAndView mv, @RequestParam(name = "pno") String pno) {
		List<BoardAllDto> blist = new ArrayList<BoardAllDto>();
		List<ReplyDto> rlist = new ArrayList<ReplyDto>();
		List<ScheduleDto> list= new ArrayList<ScheduleDto>();
		List<ProjectMemberDto> ulist= new ArrayList<ProjectMemberDto>();
		try{
			blist=baService.ListTaskBoardAll(pno);
			rlist=replyService.ListReply(pno);
			ulist=usersService.listProjectMember(pno);
			list = scheduleServ.ListScheduleAll(pno);
			System.out.println("프로젝트 user 리스트"+ulist);
			System.out.println("프로젝트 sche 리스트"+list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("schelist", list);
		mv.addObject("replylist", rlist);
		mv.addObject("userlist", ulist);
		mv.addObject("pno", pno);
		mv.setViewName("project/projectmaintest");
		return mv;
	}
	
	//프로젝트 일정 
	@RequestMapping(value = "/project/schedule/ins", method = RequestMethod.POST)
	public ModelAndView insertSchedule(ModelAndView mv, BoardAllDto alldto, ScheduleDto s,
			@RequestParam(name = "bname") String bname,
			@RequestParam(name = "bopen") int bopen,
			@RequestParam(name = "sstart") String sstart,
			@RequestParam(name = "sstarttime") String sstarttime,
			@RequestParam(name = "send") String send,
			@RequestParam(name = "sendtime") String sendtime,
			@RequestParam(name = "splace",required = false) String splace,
			@RequestParam(name = "smemo",required = false) String smemo,
			@RequestParam(name = "attendee", required = false) String attendee,
			@RequestParam(name = "pno") String pno,
			Authentication authentication) {
		 	System.out.println("공개여부" + bopen);
		 	System.out.println("프로젝트 넘버 " + pno);
		try {
			
			System.out.println("프로젝트 일정 글 인서트진입");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno=userdetail.getUno();
			String uname=userdetail.getUname();
			System.out.println("세션값확인 : " + uno);
			System.out.println("무엇이" + attendee);
			String start = sstart + " " +  sstarttime;
			System.out.println(start);
			String end = send + " " + sendtime;
			System.out.println(end);
			
			alldto.setPno(pno);
		    alldto.setUno(uno);
		    alldto.setUname(uname);
		    alldto.setBname(bname);
		    alldto.setBopen(bopen);
		    
		    s.setSstart(start);
		    s.setSend(end);
		    s.setSplace(splace);
		    s.setSmemo(smemo);
		    s.setAttendee(attendee);
		    
		    scheduleServ.insertSchedule(alldto, s, attendee);
			mv.addObject("message", "success");
		}catch(Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("/errorpage");
		}
		mv.addObject("pno", pno);
		mv.setViewName("redirect:/project/pjdetail");
		return mv;
	}
	
	//프로젝트 일정 
		@RequestMapping(value = "/project/schedule/upd", method = RequestMethod.GET)
		public ModelAndView updateSchedule(ModelAndView mv, ScheduleDto s,
				
				@RequestParam(name = "attendeeChange", required = false) String attendee,
				
				Authentication authentication) {
			System.out.println("프로젝트 일정 참여자 업데이트진입");
			 	
			 	
			 	System.out.println("참석자 변경 " + attendee);
			try {
				CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
				String uno=userdetail.getUno();
				System.out.println("세션값확인 : " + uno);
				System.out.println("무엇이" + attendee);
				
				System.out.println("글번호 : " + s.getBno());
				System.out.println("프로젝트번호 : " + s.getPno());
			    s.setAttendee(attendee);
			    
			    scheduleServ.updateSchedule(s, attendee);
				mv.addObject("message", "success");
				
			}catch(Exception e) {
				e.printStackTrace();
				mv.addObject("msg", e.getMessage());
				mv.setViewName("/errorpage");
			}
			mv.addObject("pno", s.getPno());
			mv.setViewName("redirect:/project/pjdetail");
			return mv;
		}
	
	// schedule 글 삭제
	@RequestMapping(value="/project/schedule/del",method=RequestMethod.GET)
	public ModelAndView deleteSchedule(ModelAndView mv, 
			@RequestParam(name = "bno") int bno,
			@RequestParam(name = "pno") String pno) {
				System.out.println("bno"+bno);
				System.out.println("pno"+pno);
				int rs=0;
				try {
					 rs=scheduleServ.deleteSchedule(bno);
					System.out.println(rs+"개 삭제 : task");
				} catch (Exception e) {
					e.printStackTrace();
				}
				mv.addObject("pno", pno);
				mv.addObject("deleteResult", rs);
				mv.setViewName("redirect:/project/pjdetail");
				return mv;
			}
			
	
//	전체 일정 (캘린더)
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public ModelAndView calendarlist(ModelAndView mv, @RequestParam(name = "pno") String pno) {
		System.out.println("전체일정 진입1");
		System.out.println("들어오는지 확인" + pno);
		mv.addObject("pno", pno);
		mv.setViewName("project/schedule");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value="/schedule/list", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public String selectDftest(
			@RequestParam(name = "pno") String pno, 
			Authentication authentication, HttpServletRequest request) {
			System.out.println("전체일정 진입2");
			
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uname=userdetail.getUname(); // 해당 부서의 휴가현황만 볼 수 있도록
			System.out.println("세션 값 확인 " + uname);
			
			HashMap<String, String> paramMap1 = new HashMap<String, String>();
			HashMap<String, String> paramMap2 = new HashMap<String, String>();
			paramMap1.put("pno", pno);
			paramMap2.put("pno", pno);
			List<ScheduleDto> array1 = null;
			List<ScheduleDto> array2 = null;
			
			paramMap1.put("uname", uname);
			paramMap1.put("attendee", '%'+ uname+'%');
			paramMap2.put("uname", uname);
			paramMap2.put("attendee", '%'+ uname+'%');
				
			array1 = scheduleServ.selectAllSche(paramMap1);
			System.out.println("전체일정 : " + array1);
			array2 = scheduleServ.selectAllTask(paramMap2);
			System.out.println("전체업무 : " + array2);
	
			List<ScheduleDto> joined = ListUtils.union(array1, array2);
			System.out.println("리스트합치기" + joined); 
			Gson gson = new Gson();
			return gson.toJson(joined);
	}

//사용안함
	@ResponseBody
	@RequestMapping(value="/schedule/list/test", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public String selectDfCalendar(
			@RequestParam(value = "valueChk[]", required = false) int[] valueChk,
			Authentication authentication, HttpServletRequest request) {
			System.out.println("전체일정 진입2");
			System.out.println("11체크값" + valueChk);
			
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uname=userdetail.getUname(); // 해당 부서의 휴가현황만 볼 수 있도록
			System.out.println("11세션 값 확인 " + uname);
			String pno = "22";
			
			HashMap<String, String> paramMap1 = new HashMap<String, String>();
			HashMap<String, String> paramMap2 = new HashMap<String, String>();
			paramMap1.put("pno", pno);
			paramMap2.put("pno", pno);
			List<ScheduleDto> array1 = null;
			List<ScheduleDto> array2 = null;
			
				System.out.println("111뿌려봐 " + valueChk);
				for(int i =0; i < valueChk.length; i++) {
				if(valueChk[i] == 1) {
					paramMap1.put("uname", uname);
					paramMap1.put("attendee", '%'+ uname+'%');
				}
				if(valueChk[i] == 2) {
					paramMap1.put("uname", uname);
					paramMap1.put("attendee", null);
				}
				if (valueChk[i]== 3) {
					paramMap1.put("uname", null);
					paramMap1.put("attendee", '%'+ uname+'%');
				}
				if(valueChk[i] == 4) {
					paramMap2.put("uname", uname);
					paramMap2.put("attendee", '%'+ uname+'%');
				}
				if(valueChk[i] == 5) {
					paramMap2.put("uname", uname);
					paramMap2.put("attendee", null);
				}
				if (valueChk[i] == 6) {
					paramMap2.put("uname", null);
					paramMap2.put("attendee", '%'+ uname+'%');
				}
				array1 = scheduleServ.selectAllSche(paramMap1);
				System.out.println("전체일정 : " + array1);
				array2 = scheduleServ.selectAllTask(paramMap2);
				System.out.println("전체업무 : " + array2);
				}
			//
			List<ScheduleDto> joined = ListUtils.union(array1, array2);
			System.out.println("리스트합치기" + joined); 
			Gson gson = new Gson();
			return gson.toJson(joined);
	}
}
