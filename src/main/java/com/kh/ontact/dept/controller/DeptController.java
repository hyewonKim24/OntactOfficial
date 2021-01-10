package com.kh.ontact.dept.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.dept.model.dto.DeptDto;
import com.kh.ontact.dept.model.service.DeptService;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.kh.ontact.users.model.service.UsersService;

@Controller
public class DeptController {
	@Autowired
	private DeptService deptServ;
	
	@Autowired
	private UsersService usersService;
	
	public static final int LIMIT = 10;
	//
	//부서
	@SuppressWarnings("unused")
	@RequestMapping(value = "/commute/organlist", method = RequestMethod.GET)
	public ModelAndView selectDept(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,
		    ModelAndView mv) {
			System.out.println("Dept 리스트진입");
		try {
			int currentPage = page;
			int deptlistCount = deptServ.listCount();
			int userslistCount = usersService.listCount();
			System.out.println("시험" + deptlistCount);
			System.out.println("리스트카운트" + userslistCount);
			
			int maxPage2 = (int) ((double) userslistCount / LIMIT + 0.9);
			
//			if (keyword == null && keyword == ("")){
				System.out.println("if로 들어옴");
				mv.addObject("deptlistCount", deptlistCount);
				mv.addObject("userslistCount", userslistCount);
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage2);
				mv.addObject("selectDept", deptServ.selectDept());
				mv.addObject("selectOgUser", usersService.selectOgUser(currentPage, LIMIT));
				System.out.println("결과" + usersService.selectOgUser(currentPage, LIMIT));
				mv.setViewName("/commute/organogram");
			 if (keyword != null && !keyword.equals("")) {
				System.out.println("else로 들어옴");
				mv.addObject("list", deptServ.searchDept(keyword));
				mv.setViewName("/commute/organogram");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
//	//부서별 사원
//	@RequestMapping(value = "/commute/organuserlist", method = RequestMethod.GET)
//	public ModelAndView selectUser(DeptDto d, 
//				@RequestParam(name = "page", defaultValue = "1") int page,
//				ModelAndView mv) {
//			System.out.println("Dept 리스트진입");
//		try {
//			int currentPage = page;
//			int listCountFirst = usersService.listCountFirst();
//			int maxPageFirst = (int) ((double) listCountFirst / LIMIT + 0.9);
//			
//			int listCount = usersService.listCount();
//			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
//			
//			String dno = d.getDno();
//			
//			if (dno == null && dno == ("")) { // 미분류그룹
//				System.out.println("if로 들어옴");
//				mv.addObject("listCountFirst", listCountFirst);
//				mv.addObject("selectOgFirst", usersService.selectOgFirst(currentPage,LIMIT));
//				mv.setViewName("commute/organogram");
//			} else { // 분류그룹
//				System.out.println("else로 들어옴");
//				mv.addObject("listCount", listCount);
//				mv.addObject("selectOgUser", usersService.selectOgUser(currentPage,LIMIT));
//				mv.setViewName("commute/organogram");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}
	
	//부서 생성
	@RequestMapping(value = "/commute/deptins", method = RequestMethod.POST)
	public String insertDept(DeptDto d, RedirectAttributes rttr) {
		try {
			System.out.println("인서트진입");
			System.out.println(d.getDname());
		
			deptServ.insertDept(d);
			rttr.addFlashAttribute("message", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:/commute/organlist";
	}
	
	//부서 삭제
	@RequestMapping(value = "/commute/deptdel", method = RequestMethod.GET)
	public ModelAndView deleteDept(
			@RequestParam(name = "dno") String dno,
			HttpServletRequest request, ModelAndView mv) {
		try {
//			dno에 포함되어 있는 사람이 없는 경우에만 삭제가능하도록 
			deptServ.deleteDept(dno);
			mv.setViewName("redirect:/commute/organlist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	
}
