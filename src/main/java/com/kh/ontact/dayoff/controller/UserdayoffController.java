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

import com.kh.ontact.dayoff.model.dto.DayoffDto;
import com.kh.ontact.dayoff.model.service.DayoffService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@Controller
public class UserdayoffController {
	@Autowired
	private DayoffService dayoffServ;
	public static final int LIMIT = 10;
	
	@RequestMapping(value="/dayoff/dflist", method = RequestMethod.GET)
	public ModelAndView selectOverwork(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "startdate", required = false) String startdate,
			@RequestParam(name = "enddate", required = false) String enddate,
			Authentication authentication, HttpServletRequest request, ModelAndView mv) {
			System.out.println("데이오프 리스트진입");
			
		try {
			int currentPage = page;
//			 한 페이지당 출력할 목록 갯수, 페이징
			int listCount = dayoffServ.allListCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno=userdetail.getUno();
		    System.out.println("세션값확인 : " + uno);
		    
			//검색
			String start =  startdate;
			String end = enddate;
			
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("startdate", start);
			paramMap.put("enddate", end);
			
			if (startdate == null && enddate == null) {
				System.out.println("if 문으로 들어옴");
				mv.addObject("list", dayoffServ.selectDayoff(currentPage, LIMIT, uno));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("commute/dayoff");
			} else if(startdate != null && enddate != null) {
				System.out.println("else로 들어옴");
				mv.addObject("list", dayoffServ.searchDayoff(paramMap));
				mv.setViewName("commute/dayoff");
			}
//			if (startdate != null && enddate != null) {
//				System.out.println("if 문으로 들어옴");
//				mv.addObject("list", dayoffServ.searchDayoff(paramMap));
//			} else
//				System.out.println("else로 들어옴");
//				System.out.println(startdate);
//				mv.addObject("list", dayoffServ.selectDayoff(currentPage, LIMIT));
//				System.out.println(dayoffServ.selectDayoff(currentPage, LIMIT));
//				mv.addObject("currentPage", currentPage);
//				mv.addObject("maxPage", maxPage);
//				mv.addObject("listCount", listCount);
//				mv.setViewName("user/commute/dayoff");
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "/dayoff/dayoffins", method = RequestMethod.GET)
	public String insetOverwork(DayoffDto d, Authentication authentication, RedirectAttributes rttr) {
		try {
			System.out.println("인서트진입");
			System.out.println(d.getDname());
			System.out.println(d.getUname());
		
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno=userdetail.getUno();
		    System.out.println("세션값확인 : " + uno);
		    d.setUno(uno);
		    
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
	public ModelAndView updateOverworkApp(DayoffDto d, 
			@RequestParam(name = "page", defaultValue = "1") int page,
			Authentication authentication, HttpServletRequest request, ModelAndView mv) {
		try {
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno=userdetail.getUno();
		    
		    dayoffServ.updateDayoffApp(d, uno);
		    
			if(dayoffServ.updateDayoffApp(d, uno) != null) {
				mv.addObject("dfno", dayoffServ.updateDayoffApp(d, uno).getDfno()); //가지고 들어가는 것
				mv.addObject("currentPage", page); //가지고 들어가는 것
				mv.setViewName("redirect:/dayoff/dflist"); 
			} else {
				//이전화면으로 이동
			}
		} catch (Exception e) {  
			System.out.println("transaction 실패"); 
			mv.addObject("msg", e.getMessage()); 
			mv.setViewName("errorPage");
		}
			return mv; 
	}
	
	@ResponseBody
	@RequestMapping(value="/dayoff/calendar", method = RequestMethod.GET)
	public HashMap<String, Object> selectDfCalendar(
			Authentication authentication, HttpServletRequest request) {
		System.out.println("캘린터 리스트 진입");
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
	    String dno=userdetail.getDno();
	    System.out.println("세션 값 확인" + dno);
	    
	    HashMap<String, Object> dayoffMap = new HashMap<String, Object>();
	    List<DayoffDto> dayoffCalendar = dayoffServ.selectDfCalendar();
	    System.out.println("결과 확인" + dayoffServ.selectDfCalendar());
	    dayoffMap.put("dayoffCalendar", dayoffCalendar);
//	    javaMap.put("evt1", new DayoffDto());
//	    javaMap.put("evt2", new DayoffDto());        
//	    System.out.println(javaMap);
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		String id = (String)session.getAttribute("user");
//		List<Planner> plan = mservice.myPlan(id);
//		map.put("plan", plan);
//		dayoffServ.selectDfCalendar();
		
		return dayoffMap;
	}

}
