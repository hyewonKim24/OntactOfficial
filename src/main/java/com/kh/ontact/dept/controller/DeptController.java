package com.kh.ontact.dept.controller;

import java.util.HashMap;
import java.util.List;

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
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.kh.ontact.users.model.dto.UsersDto;
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
			@RequestParam(name = "dname", required = false) String dname,
			Authentication authentication, ModelAndView mv) {
			System.out.println("Dept 리스트진입");
			System.out.println("부서이름이 들어왔나?" + dname);
			
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String cno=userdetail.getCno();
			System.out.println("세션값확인 : " + cno);
			
		try {
			int currentPage = page;
//			부서 출력
			int deptlistCount1 = deptServ.listCount(cno);
			int deptlistCount2 = deptServ.searchlistCount();
//			부서 사원 출력
			int listCount1 = usersService.listCountFirst();
			int listCount2 = usersService.listCount(dname);
			System.out.println("미분류부서 : " + listCount1 );
			System.out.println("분류부서 : " + listCount2);
			
			int maxPage1 = (int) ((double) listCount1 / LIMIT + 0.9);
			int maxPage2 = (int) ((double) listCount2 / LIMIT + 0.9);

			mv.addObject("deptlistCount", deptlistCount1);
			mv.addObject("selectDept", deptServ.selectDept(cno));
			mv.setViewName("/commute/organogram");

//			미분류그룹 default
			if (dname == null || keyword == null || keyword == "") {
				System.out.println("#####if로 들어옴");
				mv.addObject("userslistCount", listCount1);
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage1);
				mv.addObject("dname", "미분류그룹");
				mv.addObject("selectOgUser", usersService.selectOgFirst(currentPage, LIMIT));
				System.out.println("결과" + usersService.selectOgFirst(currentPage, LIMIT));
				mv.setViewName("/commute/organogram");
			}
			if (dname != null) {
				System.out.println("######dname이 있는 경우");
				mv.addObject("userslistCount", listCount2);
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage2);
				mv.addObject("dname", dname);
				mv.addObject("selectOgUser", usersService.selectOgUser(currentPage, LIMIT, dname));
				mv.setViewName("/commute/organogram");
			} 
//			부서검색			
			if(keyword != null && keyword != "") {
				mv.addObject("deptlistCount", deptlistCount2);
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
	@RequestMapping(value = "/commute/deptins", method = {RequestMethod.POST,RequestMethod.GET})
	public String insertDept(DeptDto d, RedirectAttributes rttr, Authentication authentication) {
		try {
			System.out.println("부서 생성 인서트진입");
			System.out.println(d.getDname());
			System.out.println(d.getCno());
			
			List<UsersDto> users = usersService.deleteOgUser(d.getDname());
			if(users.size() > 0) {
				rttr.addFlashAttribute("message", "사원이 존재하는 부서는 삭제하실 수 없습니다.");
			}
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
			@RequestParam(name = "cno") String cno,
			Authentication authentication, HttpServletRequest request, ModelAndView mv) {
		try {
			System.out.println("부서 삭제 인서트진입");
			System.out.println("부서번호 : "+dno);
			System.out.println("회사번호 : "+ cno);
		
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("startdate", cno);
			paramMap.put("enddate", dno);
			
//			dno에 포함되어 있는 사람이 없는 경우에만 삭제가능하도록 
			deptServ.deleteDept(paramMap);
			mv.setViewName("redirect:/commute/organlist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	
}
