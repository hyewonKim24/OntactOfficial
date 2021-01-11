package com.kh.ontact.commute.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.commute.model.dto.CommuteDto;
import com.kh.ontact.commute.model.service.CommuteService;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.google.gson.Gson;

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
			Authentication authentication, HttpServletRequest request, ModelAndView mv) {
		
		System.out.println("출퇴근 리스트진입");
		
		try {
			// 한 페이지당 출력할 목록 갯수, 페이징
			int currentPage = page;
			int listCount = commuteServ.allListCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			
			//세션값
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno=userdetail.getUno();
		    
			//검색
			String state = cstate;
			System.out.println("상태" + state);
			String start =  startdate;
			System.out.println("start" + start);
			String end = enddate;
			System.out.println("end" + end);
			
			HashMap<String, String> search = new HashMap<String, String>();
			search.put("cstate", state);
			search.put("startdate", start);
			search.put("enddate", end);
			//
			if (startdate == null && enddate == null) {
				System.out.println("if로 들어옴");
				mv.addObject("list", commuteServ.selectDailyCommute(currentPage, LIMIT, uno));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				mv.setViewName("commute/dailycommute");
			} else if(startdate != null && enddate != null) {
				System.out.println("else로 들어옴");
				mv.addObject("list", commuteServ.searchDailyCommute(search));
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
	
//	월근무내역
	@RequestMapping(value = "/commute/monthlylist", method = RequestMethod.GET)
	public ModelAndView selectMonthCommute(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "startdate", required = false) String startdate,
			@RequestParam(name = "enddate", required = false) String enddate,
			Authentication authentication, HttpServletRequest request, ModelAndView mv) {
		
		System.out.println("월근무 리스트진입");
		
		try {
			// 한 페이지당 출력할 목록 갯수, 페이징
			int currentPage = page;
			//
			int allListCount = commuteServ.mAllCount();
			System.out.println("카운트1 : " + allListCount);
			int allmaxPage = (int) ((double) allListCount / LIMIT + 0.9);
			int searchListCount = commuteServ.msearchCount();
			System.out.println("카운트2 : " + searchListCount);
			int searchmaxPage = (int) ((double) searchListCount / LIMIT + 0.9);
			
			//세션값
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno=userdetail.getUno();
		    System.out.println(uno);
		    //
			//검색
			String start =  startdate;
			System.out.println("start" + start);
			String end = enddate;
			System.out.println("end" + end);
			
			HashMap<String, String> search = new HashMap<String, String>();
			search.put("uno", uno);
			search.put("startdate", start);
			search.put("enddate", end);
			
			if (startdate == null && enddate == null) {
				System.out.println("if로 들어옴");
				mv.addObject("list", commuteServ.selectMonthCommute(currentPage, LIMIT, uno));
				System.out.println("결과 확인 : "+ commuteServ.selectMonthCommute(currentPage, LIMIT, uno));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", allmaxPage);
				mv.addObject("listCount", allListCount);
				mv.setViewName("commute/monthcommute");
			} else if(startdate != null && enddate != null) {
				System.out.println("else로 들어옴");
				mv.addObject("list", commuteServ.searchDailyCommute(search));
				System.out.println("결과 확인 : " + commuteServ.searchDailyCommute(search));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", searchmaxPage);
				mv.addObject("listCount", searchListCount);
				mv.setViewName("commute/monthcommute");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/commute/getDailyVisitor", method = RequestMethod.GET)
    public String getDailyVisitor(String month, Authentication authentication){
		//세션값
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
	    String uno=userdetail.getUno();
	    
		String cooContractNo = uno;
        System.out.println(cooContractNo);
        Gson gson = new Gson();
        HashMap<String,String> map = new HashMap<String,String>();
        map.put("month", month);
 //
        List<CommuteDto> list= commuteServ.testCommute(uno);
        System.out.println("여기" + list);
        return gson.toJson(list);
    }
}

