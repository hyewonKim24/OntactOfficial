package com.kh.ontact.overwork.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.overwork.model.dto.OverworkDto;
import com.kh.ontact.overwork.model.service.OverworkService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

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
			Authentication authentication, ModelAndView mv) {
			
		System.out.println("시간외근무 리스트 진입");
		try {
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno=userdetail.getUno();
			System.out.println("세션값확인 : " + uno);
			
			int currentPage = page;
//			 한 페이지당 출력할 목록 갯수, 페이징
			int listCount = overworkServ.listCount(uno);
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
		      
			//검색
			String start =  startdate;
			System.out.println("start" + start);
			String end = enddate;
			System.out.println("end" + end);
			
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("startdate", start);
			paramMap.put("enddate", end);
			
			if (startdate == null && enddate == null) {
				mv.addObject("list", overworkServ.selectOverwork(currentPage, LIMIT, uno));
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
	//
	@RequestMapping(value = "/overwork/ins", method = RequestMethod.GET)
	public String  insetOverwork(OverworkDto o, Authentication authentication, RedirectAttributes rttr) {
		try {
			System.out.println("인서트진입");
			
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno=userdetail.getUno();
		    String dno = userdetail.getDno();
		    String uname = userdetail.getUname();
		    System.out.println("세션값확인 : " + uno);
		    
		    o.setUno(uno);
		    o.setDno(dno);
		    
		    
		    
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
			Authentication authentication, HttpServletRequest request, ModelAndView mv) {
		try {
			System.out.println("업데이트진입");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno = userdetail.getUno();
		    
		    overworkServ.updateOverworkApp(o,uno);
		    
		    if(overworkServ.updateOverworkApp(o,uno) != null) {
				mv.addObject("owno", overworkServ.updateOverworkApp(o, uno).getOwno()); //가지고 들어가는 것
				mv.addObject("currentPage", page); //가지고 들어가는 것
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
