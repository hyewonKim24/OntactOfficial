package com.kh.ontact.commute.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.commute.model.dto.CommuteDto;
import com.kh.ontact.commute.model.service.CommuteService;

@Controller
public class UsercommuteController {
	@Autowired
	private CommuteService commuteServ;
	public static final int LIMIT = 10;

	@RequestMapping(value = "/commute/dailylist", method = RequestMethod.GET)
	public ModelAndView selectDailCommute(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "cstate", required = false) String cstate,
			@RequestParam(name = "startdate", required = false) String startdate,
			@RequestParam(name = "enddate", required = false) String enddate,
			HttpServletRequest request, ModelAndView mv) {
		System.out.println("리스트진입");
		System.out.println("이거 " +startdate);
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수, 페이징
			int listCount = commuteServ.allListCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			
			//검색
			String state = cstate;
			System.out.println("상태" + state);
			String start =  startdate;
			System.out.println("start" + start);
			String end = enddate;
			System.out.println("end" + end);
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("cstate", state);
			paramMap.put("startdate", start);
			paramMap.put("enddate", end);
			
			if (startdate == null && enddate == null) {
				System.out.println("if로 들어옴");
				mv.addObject("list", commuteServ.selectDailyCommute(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("commute/dailycommute");
			} else if(startdate != null && enddate != null) {
				System.out.println("else로 들어옴");
				mv.addObject("list", commuteServ.searchDailyCommute(paramMap));
				mv.setViewName("commute/dailycommute");
			}
//			if (paramMap != null && !paramMap.equals("")) {
//				mv.addObject("list", commuteServ.searchDailyCommute(paramMap));
//			} else {
//				mv.addObject("list", commuteServ.selectDailyCommute(currentPage, LIMIT));
//				mv.addObject("currentPage", currentPage);
//				mv.addObject("maxPage", maxPage);
//				mv.addObject("listCount", listCount);
//				mv.setViewName("user/commute/dailycommute");
//			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "/commute/qrenter", method = RequestMethod.GET)
	public ModelAndView qrenter(ModelAndView mv) {
		System.out.println("스캐너호출");
		mv.setViewName("commute/qrenter");
		return mv;
	}
	@RequestMapping(value = "/commute/qrleave", method = RequestMethod.GET)
	public ModelAndView qrscanner(ModelAndView mv) {
		System.out.println("스캐너호출");
		mv.setViewName("commute/qrleave");
		return mv;
	}
	
	@RequestMapping(value = "/commute/enter", method = RequestMethod.GET)
	public String insertEnter(CommuteDto c, 
			HttpServletRequest request, RedirectAttributes rttr) {
		try {
			System.out.println("인서트진입");
			String enterInfo = request.getParameter("enterInfo");
			System.out.println(enterInfo);
			String [] array = enterInfo.split(",");

			for(int i=0; i<array.length; i++) {
				System.out.println(array[i]);
			}

			String cstarttime = array[0];
			String dname = array[1];
			String uname = array[2];
			
			c.setDname(dname);
			c.setUname(uname);
			c.setCstarttime(cstarttime);
			
			commuteServ.insertEnter(c);
			rttr.addFlashAttribute("message", "window.open(\"about:blank\", \"_self\").close();");
			rttr.addFlashAttribute("alert", "alert(\"출근이 인증되었습니다.\");");
		} catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:qrenter";
	}

	@RequestMapping(value = "/commute/leave", method = RequestMethod.GET)
	public String updateLeave(CommuteDto c, HttpServletRequest request, RedirectAttributes rttr) {
		try {
			System.out.println("퇴근인서트진입");
			String enterInfo = request.getParameter("enterInfo");
			System.out.println(enterInfo);
			String [] array = enterInfo.split(",");

			for(int i=0; i<array.length; i++) {
				System.out.println(array[i]);
			}
			String cendtime = array[0];
			String dname = array[1];
			String uname = array[2];
			
			c.setCendtime(cendtime);
			c.setDname(dname);
			c.setUname(uname);
			
			commuteServ.updateLeave(c);
			rttr.addFlashAttribute("message", "window.open(\"about:blank\", \"_self\").close();");
			rttr.addFlashAttribute("alert", "alert(\"퇴근이 인증되었습니다.\");");
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:qrleave";
	}
}

