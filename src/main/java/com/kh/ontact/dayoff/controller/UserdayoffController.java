package com.kh.ontact.dayoff.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.dayoff.model.dto.DayoffDto;
import com.kh.ontact.dayoff.model.service.DayoffService;

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
			HttpServletRequest request, ModelAndView mv) {
			System.out.println("데이오프 리스트진입");
			
		try {
			int currentPage = page;
//			 한 페이지당 출력할 목록 갯수, 페이징
			int listCount = dayoffServ.allListCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			
			//검색
//			String startdate = request.getParameter("startdate");
//			String enddate = request.getParameter("enddate");
			String start =  startdate;
			String end = enddate;
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("startdate", start);
			paramMap.put("enddate", end);
			
			if (startdate == null && enddate == null) {
				System.out.println("if 문으로 들어옴");
				mv.addObject("list", dayoffServ.selectDayoff(currentPage, LIMIT));
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
	
	@RequestMapping(value = "/dayoff/dayoffins", method = RequestMethod.POST)
	public String insetOverwork(DayoffDto d, RedirectAttributes rttr) {
		try {
			System.out.println("인서트진입");
			System.out.println(d.getDname());
			System.out.println(d.getUname());
		
			dayoffServ.insertDayoff(d);
			rttr.addFlashAttribute("message", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:commute/dayoff";
	}
	
	@RequestMapping(value = "/dayoff/dfappupd", method = RequestMethod.POST)
	public ModelAndView updateOverworkApp(DayoffDto d, 
			@RequestParam(name = "page", defaultValue = "1") int page,
			HttpServletRequest request, ModelAndView mv) {
		try {
			
			if(dayoffServ.updateDayoffApp(d) != null) {
				mv.addObject("currentPage", page); //가지고 들어가는 것
				mv.addObject("owno", dayoffServ.updateDayoffApp(d).getDfno()); //가지고 들어가는 것
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
}
