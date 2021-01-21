package com.kh.ontact.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.commonboard.model.service.CommonboardService;
import com.kh.ontact.project.reply.model.dto.ReplyDto;
import com.kh.ontact.project.reply.model.service.ReplyService;
import com.kh.ontact.project.task.model.dto.TaskDto;
import com.kh.ontact.project.task.model.service.TaskService;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.projectMember.model.service.ProjectMemberService;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.model.service.UsersService;

@Controller
public class PtaskController {

	@Autowired
	TaskService taskService;
	@Autowired
	ReplyService replyService;

	@Autowired
	CommonboardService commonboardservice;
	@Autowired
	UsersService usersService;

	public static final int LIMIT = 20;
	
	@RequestMapping(value = "ptasktest", method = RequestMethod.GET)
	public String calendartest(ModelAndView mv) {
		return "project/ptask";
	}
	
	@ResponseBody
	@RequestMapping(value = "ptask", method = RequestMethod.GET)
	public String projectPtask(@RequestParam(value = "valueChk[]", required = false) int[] valueChk,
			Authentication authentication, HttpServletRequest request) throws Exception {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uname=userdetail.getUname();
		String pno = "22"; // 나중에 수정
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("pno", pno);
		List<TaskDto> array = null;
		System.out.println(valueChk);
		for(int i =0; i < valueChk.length; i++){
			if(valueChk[i] == 1){
				
			    paramMap.put("uname", uname);
			    paramMap.put("taskmanger", null);
			    paramMap.put("tstate", null);

			    if(valueChk[i] ==4){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "1");
			    }
			    if(valueChk[i] ==5){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "2");
			    }
			    if(valueChk[i] ==6){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "3");
			    }
			    if(valueChk[i] ==7){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "4");
			    }
			}
			if(valueChk[i] == 2){
			    paramMap.put("uname", null);
			    paramMap.put("taskmanger", uname);
			    paramMap.put("tstate", null);

			    if(valueChk[i] ==4){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "1");
			    }
			    if(valueChk[i] ==5){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "2");
			    }
			    if(valueChk[i] ==6){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "3");
			    }
			    if(valueChk[i] ==7){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "4");
			    }
			}
			if(valueChk[i] == 3){
			    paramMap.put("uname", null);
			    paramMap.put("taskmanger", null);
			    paramMap.put("tstate", null);

			    if(valueChk[i] ==4){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "1");
			    }
			    if(valueChk[i] ==5){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "2");
			    }
			    if(valueChk[i] ==6){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "3");
			    }
			    if(valueChk[i] ==7){
			        paramMap.put("uname", uname);
			        paramMap.put("taskmanger", null);
			        paramMap.put("tstate", "4");
			    }
			}
			
			array = taskService.PListPTaskAll(paramMap);
			}
		Gson gson = new Gson();
		return gson.toJson(array);
		
			
		}
		
		
//		try {
//			List<TaskDto> list = new ArrayList<TaskDto>();
//			int to = Integer.parseInt(pno);
//			int currentPage = page;
//			int listCount = taskService.listCount(to);
//			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
//			list = taskService.PListPTaskAll(currentPage, LIMIT, pno);
//			System.out.println("글 전체리스트" + taskService.PListPTaskAll(currentPage, LIMIT, pno));
//			System.out.println("글전체수" + listCount);
//			mv.addObject("pno", pno);
//			mv.addObject("currentPage", currentPage);
//			mv.addObject("maxPage", maxPage);
//			mv.addObject("listCount", listCount);
//			mv.addObject("tasklist", list);
//			mv.setViewName("project/ptask");
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//
//		return mv;

//	}

//	@RequestMapping(value = "ptasktest", method = RequestMethod.GET)
//	public ModelAndView ptasktest(ModelAndView mv, @RequestParam(name = "bno") int bno,
//			@RequestParam(name = "page", defaultValue = "1") int page) {
//
//		try {
//			int currentPage = page;
//			// 한 페이지당 출력할 목록 갯수
//			mv.addObject("currentPage", currentPage);
//			mv.setViewName("project/ptask_test");
//		} catch (Exception e) {
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}

	// 프로젝트 디테일로 들어가기 ( task만 가지고 들어감 + 추가 예정 )
	@RequestMapping(value = "/project/ptask", method = RequestMethod.GET)
	public ModelAndView pprojectDetail(ModelAndView mv, @RequestParam(name = "pno") String pno, UsersDto dto, TaskDto Tdto,
			@RequestParam(name = "bno") int bno,
			@RequestParam(value = "mcount", required = false) String mcount) {
		/* String pno = "2"; */
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		String cno = user.getCno();
		String uno = user.getUno();
		BoardAllDto Bdto = new BoardAllDto();
		List<ReplyDto> rlist = new ArrayList<ReplyDto>();
		List<ReplyDto> rclist = new ArrayList<ReplyDto>();
		List<TaskDto> list = new ArrayList<TaskDto>();
		List<ProjectMemberDto> ulist = new ArrayList<ProjectMemberDto>();
		
		Bdto.setBno(bno);
		Bdto.setPno(pno);
		dto.setPno(pno);
		dto.setCno(cno);
		dto.setUno(uno);
		List<UsersDto> pmlist = new ArrayList<UsersDto>();
		int userListSize = 0;
		try {
			// 업무글리스트
			list = taskService.selectOne(Bdto);
			System.out.println("글 blist" + list + "글 blist");
			// 댓글리스트
			rlist = replyService.ListReply(pno);
			System.out.println("글 replylist" + rlist + "글 replylist");
			// 댓글 카운트수
			rclist = replyService.ReplyCount(pno);
			System.out.println("댓글 카운트 list" + rclist);
			// 프로젝트 유저리스트
			ulist = usersService.listProjectMember(pno);
			System.out.println("프로젝트 user 리스트" + ulist);
			userListSize = ulist.size();
			// 프로젝트 초대 리스트
			pmlist = usersService.projectInviteList(dto);
			System.out.println("프로젝트 초대 리스트:" + pmlist);
			// 은실 임의로 넣음
			mv.addObject("blist", commonboardservice.getCommonboard());
			mv.addObject("file", commonboardservice.getFileboard(pno));
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("rclist", rclist);
		mv.addObject("pmlist", pmlist);
		mv.addObject("tasklist", list);
		mv.addObject("replylist", rlist);
		mv.addObject("userlist", ulist);
		mv.addObject("userListSize", userListSize);
		mv.addObject("userSize", userListSize - 1);
		if (mcount != null) {
			mv.addObject("inviteSuccess", "프로젝트에 " + mcount + "명이 초대되었습니다");
		}
		mv.addObject("pno", pno);
		mv.setViewName("project/ptask_test");
		// mv.setViewName("project/test01");
		return mv;
	}

}