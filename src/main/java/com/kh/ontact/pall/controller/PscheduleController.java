package com.kh.ontact.pall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ontact.dayoff.model.dto.DayoffDto;
import com.kh.ontact.dayoff.model.service.DayoffService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@Controller
public class PscheduleController {
	
	@Autowired
	private DayoffService dayoffServ;
	public static final int LIMIT = 10;
	
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public String calendarlist(ModelAndView mv) {
		System.out.println("전체일정 진입");
		return "project/schedule";
	}
	
	@ResponseBody
	@RequestMapping(value="/schedule/list", method = RequestMethod.GET)
	public String selectDfCalendar(
			Authentication authentication, HttpServletRequest request) {
		
		System.out.println("전체일정 진입2");
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String dno=userdetail.getDno(); // 해당 부서의 휴가현황만 볼 수 있도록
		System.out.println("세션 값 확인" + dno);

	    Gson gson = new Gson();
		List<DayoffDto> dayoffCalendar = dayoffServ.selectDfCalendar(dno);
		System.out.println("결과 확인" + dayoffCalendar);

		return gson.toJson(dayoffCalendar);
	}
	
}
