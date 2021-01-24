package com.kh.ontact.dayoff.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.kh.ontact.dayoff.model.service.DayoffService;
import com.kh.ontact.dept.model.service.DeptService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@Controller
public class UserdayoffController {
	@Autowired
	private DayoffService dayoffServ;
	
	@Autowired
	private DeptService deptServ;
	
	public static final int LIMIT = 10;
	
	@RequestMapping(value="/dayoff/dflist", method = RequestMethod.GET)
	public ModelAndView selectDayoffList(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "startdate", required = false) String startdate,
			@RequestParam(name = "enddate", required = false) String enddate,
			Authentication authentication, HttpServletRequest request, ModelAndView mv) {
			System.out.println("데이오프 리스트진입");
			
		try {
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno=userdetail.getUno();
			String cno=userdetail.getCno();
			
			HashMap<String, String> paramMap = new HashMap<String, String>();
			int currentPage = page;
///			한 페이지당 출력할 목록 갯수, 페이징
			int listCount1 = dayoffServ.allListCount(uno);
			int maxPage = (int) ((double) listCount1 / LIMIT + 0.9);
			//
			String start =  startdate;
			System.out.println("start" + start);
			String end = enddate;
			System.out.println("end" + end);
			
			paramMap.put("uno", uno);
			paramMap.put("startdate", start);
			paramMap.put("enddate", end);
			int listCount2 = dayoffServ.listCount(paramMap);
			
			if (startdate == null && enddate == null) {
				System.out.println("if 문으로 들어옴");
				mv.addObject("list", dayoffServ.selectDayoff(currentPage, LIMIT, uno));
				System.out.println(dayoffServ.selectDayoff(currentPage, LIMIT, uno));
				mv.addObject("deptlist", deptServ.selectListDept(cno));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount1);
				mv.setViewName("commute/dayoff");
			} else if(startdate != null && enddate != null) {
				System.out.println("else로 들어옴");
				mv.addObject("list", dayoffServ.searchDayoff(paramMap));
				mv.addObject("deptlist", deptServ.selectListDept(cno));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount2);
				mv.setViewName("commute/dayoff");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "/dayoff/dayoffins", method = RequestMethod.POST)
	public String insertDayoff(DayoffDto d, Authentication authentication, RedirectAttributes rttr) {
		try {
			System.out.println("인서트진입");
		
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno=userdetail.getUno();
		    String dno=userdetail.getDno();
		    System.out.println("세션값확인 : " + uno);
		  
		    System.out.println("시작날짜" + d.getOffstart());
		    System.out.println("종료날짜" + d.getOffend());
		    d.setUno(uno);
		    d.setDno(dno);
			
		    dayoffServ.insertDayoff(d);
			rttr.addFlashAttribute("message", "success");
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:/dayoff/dflist";
	}
	
	
	@RequestMapping(value = "/dayoff/dfappupd", method = RequestMethod.POST)
	public ModelAndView updateDayoffApp( 
			@RequestParam(name = "hiddenname") String dfno, 
			ModelAndView mv, Authentication authentication) {
			
		System.out.println("승인 업데이트 진입");
		try {
			System.out.println(dfno);
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno = userdetail.getUno();
		    
		    dayoffServ.updateDayoffApp(dfno);
		    mv.setViewName("redirect:/dayoff/dflist");
		} catch (Exception e) {  
			System.out.println("update 실패"); 
			mv.addObject("msg", e.getMessage()); 
			mv.setViewName("errorPage");
		}
			return mv; 
	}
	
	@RequestMapping(value = "/dayoff/calendarlist", method = RequestMethod.GET)
	public String calendarlist(ModelAndView mv) {
		System.out.println("캘린더 진입");
		return "commute/dayofflist";
	}
	
	@ResponseBody
	@RequestMapping(value="/dayoff/calendar",  produces = "application/text; charset=utf8")
	public String selectDfCalendar(
			Authentication authentication, HttpServletRequest request) {
		
		System.out.println("캘린더 진입2");
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();		
		String cno=userdetail.getCno(); // 해당 부서의 휴가현황만 볼 수 있도록
		String dno=userdetail.getDno(); // 해당 부서의 휴가현황만 볼 수 있도록
		//
		System.out.println("dno 확인 해보자 : " + dno);
		System.out.println("cno 확인 해보자 : " + cno);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("cno", cno);
		paramMap.put("dno", dno);
		
		List<DayoffDto> dayoffCalendar = dayoffServ.selectDfCalendar(paramMap);
		System.out.println("결과 확인" + dayoffCalendar);
		
		Gson gson = new Gson();

		return gson.toJson(dayoffCalendar);
	}

}
