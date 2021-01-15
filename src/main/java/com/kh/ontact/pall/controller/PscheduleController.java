package com.kh.ontact.pall.controller;

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
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.project.schedule.model.service.ScheduleService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@Controller
public class PscheduleController {
	
	@Autowired
	private ScheduleService scheduleServ;
	
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
		List<ScheduleDto> selectSche = scheduleServ.selectSche(paramMap);
		List<ScheduleDto> selectTaskSche = scheduleServ.selectTaskSche(paramMap);
		List<ScheduleDto> joined = ListUtils.union(selectSche, selectTaskSche);
		System.out.println("리스트합치기" + joined); 
		Gson gson = new Gson();
		return gson.toJson(joined);

	}
	
	@RequestMapping(value = "/project/schelist", method = RequestMethod.GET)
	public String schedulelist(ModelAndView mv) {
		System.out.println("프로젝트 일정 진입");
		return "project/projectSche";
	}
	
	@RequestMapping(value = "/project/schedule/ins", method = RequestMethod.GET)
	public String insertSchedule(ScheduleDto s, Authentication authentication, RedirectAttributes rttr) {
		try {
			System.out.println("인서트진입");
		
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno=userdetail.getUno();
		    String dno=userdetail.getDno();
		    
		    System.out.println("세션값확인 : " + uno);
//		    d.setUno(uno);
//		    d.setDno(dno);
//			//
//		    dayoffServ.insertDayoff(d);
			rttr.addFlashAttribute("message", "success");
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:/dayoff/dflist";
	}
	
	
	
	
}
