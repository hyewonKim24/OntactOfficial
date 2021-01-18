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
import com.kh.ontact.dayoff.model.dto.DayoffDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.boardall.model.service.BoardAllService;
import com.kh.ontact.project.reply.model.dto.ReplyDto;
import com.kh.ontact.project.reply.model.service.ReplyService;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.project.schedule.model.service.ScheduleService;
import com.kh.ontact.project.task.model.dto.TaskDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
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
	
	//메인화면 이동
	@RequestMapping("/scheduleboard")
	public ModelAndView main(ModelAndView mv) {
		List<BoardAllDto> blist = new ArrayList<BoardAllDto>();
		List<ReplyDto> rlist = new ArrayList<ReplyDto>();
		List<ScheduleDto> list= new ArrayList<ScheduleDto>();
		List<ProjectMemberDto> ulist= new ArrayList<ProjectMemberDto>();
		//
		String pno = "22";
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
		mv.setViewName("project/projectSche");
		return mv;
	}
	
	//프로젝트 일정 
	@RequestMapping(value = "/project/schedule/ins", method = RequestMethod.GET)
	public String insertSchedule(BoardAllDto alldto, ScheduleDto s,
			@RequestParam(name = "sstart") String sstart,
			@RequestParam(name = "sstarttime") String sstarttime,
			@RequestParam(name = "send") String send,
			@RequestParam(name = "sendtime") String sendtime,
			@RequestParam(name = "attendee", required = false) String attendee,
			Authentication authentication, RedirectAttributes rttr) {
		
		try {
			System.out.println("프로젝트 일정 글 인서트진입");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno=userdetail.getUno();
			System.out.println("세션값확인 : " + uno);
			System.out.println("무엇이" + attendee);
			String start = sstart + " " +  sstarttime;
			System.out.println(start);
			String end = send + " " + sendtime;
			System.out.println(end);
			
		    alldto.setUno(uno);
		    s.setSstart(start);
		    s.setSend(end);
		    s.setAttendee(attendee);
		    
		    scheduleServ.insertSchedule(alldto, s, attendee);
			rttr.addFlashAttribute("message", "success");
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:/scheduleboard";
	}
	//
//	전체 일정 (캘린더)
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public String calendarlist(ModelAndView mv) {
		System.out.println("전체일정 진입");
		return "project/schedule";
	}
	
	@ResponseBody
	@RequestMapping(value="/schedule/list", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public String selectDfCalendar(
			@RequestParam(value = "valueChk[]", required = false) int[] valueChk,
			Authentication authentication, HttpServletRequest request) {
			System.out.println("전체일정 진입2");
			System.out.println("11체크값" + valueChk);
			
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uname=userdetail.getUname(); // 해당 부서의 휴가현황만 볼 수 있도록
			System.out.println("11세션 값 확인 " + uname);
//			List<String> valueArr = request.getParameter("chk");
			//
			HashMap<String, String> paramMap1 = new HashMap<String, String>();
			HashMap<String, String> paramMap2 = new HashMap<String, String>();
			List<ScheduleDto> array1 = null;
			List<ScheduleDto> array2 = null;
			for (int i =0; i < valueChk.length; i++) {
				System.out.println("111뿌려봐 " + valueChk[i]);
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
//			List<ScheduleDto> selectSche = 
//			System.out.println("스케줄" + selectSche);
//			List<ScheduleDto> selectTaskSche = scheduleServ.selectAllTask(valueChk);
//			System.out.println("업무" + selectTaskSche);
			
//			List<ScheduleDto> selectSche = scheduleServ.selectAllSche(valueChk);
//			System.out.println("스케줄" + selectSche);
//			List<ScheduleDto> selectTaskSche = scheduleServ.selectAllTask(valueChk);
//			System.out.println("업무" + selectTaskSche);
			List<ScheduleDto> joined = ListUtils.union(array1, array2);
			System.out.println("리스트합치기" + joined); 
			Gson gson = new Gson();
			return gson.toJson(joined);
//			int i = 0;
//			System.out.println("뿌려봐2" + valueChk[i]);
//			String buno = uname;
//			String svuno = uno;
//			int sche = Integer.parseInt(request.getParameter("sche"));
//			int task = Integer.parseInt(request.getParameter("task"));
//			System.out.println("체크박스 값확인" + sche + task);
//		int sche = 1;
//		int task = 3;
//		System.out.println(sche);
		
		
		
//		if(valueChk[i] != 0) {
//		}
//		try {
//		HashMap<String, String> paramMap = new HashMap<String, String>();
//		paramMap.put("buno", "1");
//		paramMap.put("svuno", "0");
//     	List<ScheduleDto> selectSche = scheduleServ.selectSche(paramMap);
//     	System.out.println("일정리스트" + selectSche);
//     	Gson gson = new Gson();
//     	return gson.toJson(selectSche);
//	} catch (Exception e) {
//		e.printStackTrace();
//	}
	}
}
