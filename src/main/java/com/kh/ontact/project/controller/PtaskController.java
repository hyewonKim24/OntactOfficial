package com.kh.ontact.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.project.task.model.dto.TaskDto;
import com.kh.ontact.project.task.model.service.TaskService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@Controller
@RequestMapping("/project")
public class PtaskController {

	@Autowired
	TaskService taskService;

	public static final int LIMIT = 20;
	
	@RequestMapping(value = "/task")
	public ModelAndView ptaskMy(ModelAndView mv, Authentication authentication) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uname=userdetail.getUname();
		String pno = "22"; //임시
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("pno", pno);
		paramMap.put("uname", uname);
		
		List<TaskDto> task = null;
		try {
			task = taskService.PListTaskMy(paramMap);
			System.out.println("업무 리스트 : "+task);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("tasklist", task);
		mv.addObject("pno",pno);
		mv.setViewName("project/ptask");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/taskmy")
	public List<TaskDto> ptaskmy(HttpServletRequest request, Authentication authentication, String pno) throws Exception {
		System.out.println(pno+"pno 잘 들어오는지?");
		HashMap<String, String> paramMap = new HashMap<String, String>();
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uname=userdetail.getUname();
		paramMap.put("pno", pno);
		paramMap.put("uname", uname);
		
		List<TaskDto> list = null;
		try {
			list = taskService.PListTaskMy(paramMap);
			System.out.println("모든업무 : "+list);
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/taskrequire")
	public List<TaskDto> ptaskrequire(Authentication authentication, HttpServletRequest request, String pno) throws Exception {
		System.out.println(pno+"pno 잘 들어오는지?");
		
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uname=userdetail.getUname();
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("pno", pno);
		paramMap.put("uname", uname);
		List<TaskDto> list = null;
		try {
			list = taskService.PListTaskRequire(paramMap);
			System.out.println("요청업무 : "+list);
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/taskall")
	public List<TaskDto> ptaskall(HttpServletRequest request, String pno) throws Exception {
		System.out.println(pno+"pno 잘 들어오는지?");
		List<TaskDto> list = null;
		try {
			list = taskService.PListTaskAll(pno);
			System.out.println("모든업무 : "+list);
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		return list;
	}

}