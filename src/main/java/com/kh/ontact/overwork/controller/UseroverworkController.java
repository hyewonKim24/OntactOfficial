package com.kh.ontact.overwork.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.overwork.model.dto.OverworkDto;
import com.kh.ontact.overwork.model.service.OverworkService;

@Controller
public class UseroverworkController {
	@Autowired
	private OverworkService overworkServ;
	public static final int LIMIT = 10;
	
	@RequestMapping(value = "/overwork/owlist", method = RequestMethod.GET)
	public ModelAndView selectOverwork(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "startdate", required = false) String startdate,
			@RequestParam(name = "enddate", required = false) String enddate,
			HttpServletRequest request, ModelAndView mv) {
			System.out.println("시간외근무 리스트 진");
		try {
			int currentPage = page;
//			 한 페이지당 출력할 목록 갯수, 페이징
			int listCount = overworkServ.listCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			
			//검색
//			String startdate = request.getParameter("startdate");
//			String enddate = request.getParameter("enddate");
			String start =  startdate;
			System.out.println("start" + start);
			String end = enddate;
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("startdate", start);
			paramMap.put("enddate", end);
			
			if (startdate == null && enddate == null) {
				mv.addObject("list", overworkServ.selectOverwork(currentPage, LIMIT));
				System.out.println(overworkServ.selectOverwork(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("commute/overcommute");
			} else if (startdate != null && enddate != null) {
				mv.addObject("list", overworkServ.searchOverwork(paramMap));
				mv.setViewName("commute/overcommute");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "/overwork/ins", method = RequestMethod.GET)
	public String  insetOverwork(OverworkDto o, RedirectAttributes rttr) {
		try {
			System.out.println("인서트진입");
			overworkServ.insertOverwork(o);
			rttr.addFlashAttribute("message", "success");
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:/overwork/owlist";
	}
	
	@RequestMapping(value = "/overwork/owupd", method = RequestMethod.POST)
	public ModelAndView updateOverworkApp(OverworkDto o, 
			@RequestParam(name = "page", defaultValue = "1") int page,
			HttpServletRequest request, ModelAndView mv) {
		try {
			
			if(overworkServ.updateOverworkApp(o) != null) {
				mv.addObject("currentPage", page); //가지고 들어가는 것
				mv.addObject("owno", overworkServ.updateOverworkApp(o).getOwno()); //가지고 들어가는 것
				mv.setViewName("redirect:/overwork/owlist"); 
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
