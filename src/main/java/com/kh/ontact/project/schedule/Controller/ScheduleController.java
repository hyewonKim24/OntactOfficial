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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.ontact.dayoff.model.dto.DayoffDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.reply.model.dto.ReplyDto;
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
	private ScheduleService scheduleServ;
	
	@Autowired
	private UsersService usersService;
	
	//메인화면 이동
	@RequestMapping("/scheduleboard")
	public ModelAndView main(ModelAndView mv) {
		List<ProjectMemberDto> ulist= new ArrayList<ProjectMemberDto>();
		String pno = "1";
		try{
			ulist=usersService.listProjectMember(pno);
			System.out.println("프로젝트 user 리스트"+ulist);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
			Authentication authentication, RedirectAttributes rttr) {
		
		try {
			System.out.println("프로젝트 일정 글 인서트진입");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno=userdetail.getUno();
			System.out.println("세션값확인 : " + uno);
			
			String start = sstart + " " +  sstarttime;
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH24:mm");
//			String  start = sdf.parse(sstart + " " +  sstarttime);
			System.out.println(start);
			String end = send + " " + sendtime;
			System.out.println(end);
			
		    alldto.setUno(uno);
		    s.setSstart(start);
		    s.setSend(end);
		    //
//		    s.setSstart((Date) sdf.parse(start));
//		    s.setSend((Date) sdf.parse(end));
		    
		    scheduleServ.insertSchedule(alldto, s);
			rttr.addFlashAttribute("message", "success");
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:/scheduleboard";
	}
	
	
	
	
//	전체 일정 (캘린더)
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public String calendarlist(ModelAndView mv) {
		System.out.println("전체일정 진입");
		return "project/schedule";
	}
	
	@ResponseBody
	@RequestMapping(value="/schedule/list", method = RequestMethod.GET)
	public String selectDfCalendar(
//			@RequestParam(name = "sche", required = false) int sche,
//			@RequestParam(name = "task", required = false) int task,
			Authentication authentication, HttpServletRequest request) {
		//
		System.out.println("전체일정 진입2");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno=userdetail.getUno(); // 해당 부서의 휴가현황만 볼 수 있도록
			System.out.println("세션 값 확인" + uno);
			String buno = uno;
			String svuno = uno;
//		try {
//			HashMap<String, String> paramMap = new HashMap<String, String>();
//			paramMap.put("buno", "1");
//			paramMap.put("svuno", "0");
//	     	List<ScheduleDto> selectSche = scheduleServ.selectSche(paramMap);
//	     	System.out.println("일정리스트" + selectSche);
//	     	Gson gson = new Gson();
//	     	return gson.toJson(selectSche);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
			int sche = Integer.parseInt(request.getParameter("sche"));
			int task = Integer.parseInt(request.getParameter("task"));
			System.out.println("체크박스 값확인" + sche + task);
			
//		int sche = 1;
//		int task = 3;
		HashMap<String, String> paramMap = new HashMap<String, String>();
		System.out.println(sche);
		if(sche != 0) { // 내가 등록한 일정
			if(sche == 1) {
				paramMap.put("buno", uno);
				paramMap.put("svuno", "0");
			}
			if(sche == 2) {
				paramMap.put("buno", "0");
				paramMap.put("svuno", uno);
			} 
			if (sche == 1 && sche == 2) {
				paramMap.put("buno", "null");
				paramMap.put("svuno", "null");
			}
		}
		//
		if(task != 0) {
			if(task == 3) {
				paramMap.put("buno", "null");
				paramMap.put("svuno", "null");
			}
			if(task == 4) {
				paramMap.put("buno", uno);
				paramMap.put("svuno", "0");
			}
			if (task == 5) {
				paramMap.put("buno", "0");
				paramMap.put("svuno", uno);
			} 
			
		}
		List<ScheduleDto> selectSche = scheduleServ.selectAllSche(paramMap);
		List<ScheduleDto> selectTaskSche = scheduleServ.selectAllTask(paramMap);
		List<ScheduleDto> joined = ListUtils.union(selectSche, selectTaskSche);
		System.out.println("리스트합치기" + joined); 
		Gson gson = new Gson();
		return gson.toJson(joined);

	}
	
	
	
	
	
	
}
