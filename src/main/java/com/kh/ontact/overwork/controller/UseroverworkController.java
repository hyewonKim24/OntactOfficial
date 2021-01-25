package com.kh.ontact.overwork.controller;

import java.util.HashMap;
import java.util.List;

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

import com.kh.ontact.dept.model.service.DeptService;
import com.kh.ontact.overwork.model.dto.OverworkDto;
import com.kh.ontact.overwork.model.service.OverworkService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@Controller
public class UseroverworkController {
	@Autowired
	private OverworkService overworkServ;
	
	@Autowired
	private DeptService deptServ;
	
	public static final int LIMIT = 10;
	
	@RequestMapping(value = "/overwork/owlist", method = RequestMethod.GET)
	public ModelAndView selectOverwork(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "startdate", required = false) String startdate,
			@RequestParam(name = "enddate", required = false) String enddate,
			Authentication authentication, HttpServletRequest request, ModelAndView mv) {
			
		System.out.println("시간외근무 리스트 진입");
		try {
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno=userdetail.getUno();
			String cno=userdetail.getCno();
			
			
			System.out.println("#####bbbb");
			String start =  startdate;
			System.out.println("start" + start);
			String end = enddate;
			System.out.println("end" + end);
			//
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("uno", uno);
			paramMap.put("startdate", start);
			paramMap.put("enddate", end);
			
			int currentPage = page;
//			 한 페이지당 출력할 목록 갯수, 페이징
			int listCount1 = overworkServ.listCount(uno);
			int maxPage1 = (int) ((double) listCount1 / LIMIT + 0.9);
			int listCount2 = overworkServ.searchlistCount(paramMap);
			int maxPage2 = (int) ((double) listCount2 / LIMIT + 0.9);
			//
			
			if (startdate == null || startdate == ""  && enddate == null || enddate == "") {
				System.out.println("#####aaaa");
				List<OverworkDto> list = overworkServ.selectOverwork(currentPage, LIMIT, uno);
				mv.addObject("deptlist", deptServ.selectListDept(cno));
				mv.addObject("list", list);
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage1);
				mv.addObject("listCount", listCount1);
				mv.setViewName("commute/overcommute");
			} else if (startdate != null || startdate != "" && enddate != null || enddate != "") {
				mv.addObject("deptlist", deptServ.selectListDept(cno));
				mv.addObject("list", overworkServ.searchOverwork(currentPage, LIMIT, paramMap));
				System.out.println("결과" + overworkServ.searchOverwork(currentPage, LIMIT, paramMap));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage2);
				mv.addObject("listCount", listCount2);
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
	@RequestMapping(value = "/overwork/ins", method = RequestMethod.POST)
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
			rttr.addFlashAttribute("msg", "success");
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:/overwork/owlist";
	}
	
	@RequestMapping(value = "/overwork/owupd", method = RequestMethod.POST)
	public ModelAndView updateOverworkApp( 
			@RequestParam(name = "hiddenname") String owno,
			Authentication authentication, ModelAndView mv) {
		try {
			System.out.println("업데이트진입했다");
			System.out.println(owno);
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno = userdetail.getUno();
		    
		    int rs = overworkServ.updateOverworkApp(owno);
		    if(rs != 0) {
		    	mv.addObject("msg", "success");
		    	mv.setViewName("redirect:/overwork/owlist");
		    } else {
		    	mv.addObject("msg", "failed");
		    	mv.setViewName("redirect:/overwork/owlist");
		    }
		} catch (Exception e) {  
			System.out.println("update 실패"); 
			mv.addObject("msg", e.getMessage()); 
			mv.setViewName("errorPage");
		}
			return mv; 
	}
	
}
