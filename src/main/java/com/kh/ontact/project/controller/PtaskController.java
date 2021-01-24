package com.kh.ontact.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.transform.impl.AddDelegateTransformer;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.commonboard.model.service.CommonboardService;
import com.kh.ontact.project.model.service.ProjectService;
import com.kh.ontact.project.reply.model.dto.ReplyDto;
import com.kh.ontact.project.reply.model.service.ReplyService;
import com.kh.ontact.project.task.model.dto.TaskDto;
import com.kh.ontact.project.task.model.service.TaskService;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.model.service.UsersService;

@Controller
@RequestMapping("/project")
public class PtaskController {

	@Autowired
	TaskService taskService;
	@Autowired
	ReplyService replyService;
	@Autowired
	UsersService usersService;
	@Autowired
	CommonboardService commonboardservice;
	@Autowired
	ProjectService pjService;

	public static final int LIMIT = 20;

	@RequestMapping(value = "/task")
	public ModelAndView ptaskMy(ModelAndView mv, Authentication authentication,
			 @RequestParam(name = "pno", required = false) String pno) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uname = userdetail.getUname();
//		String pno = "22"; // 임시
		String cno = userdetail.getCno();
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("uname", uname);

		List<TaskDto> task = null;
		try {
			task = taskService.PListTaskMy(paramMap);
			//혜원 : 추가 코드 (삭제금지)
			String ppno=null;
			System.out.println("프로젝트 번호:"+pno);
			if(pno==null || pno.equals("")) {
				ppno = pjService.SelectCompanyPno(cno);
				System.out.println("회사 프로젝트 번호:"+ppno);
				paramMap.put("pno", ppno);
				task = taskService.PListTaskMy(paramMap);
				mv.addObject("pno", ppno);
			}else {
				paramMap.put("pno", pno);
				task = taskService.PListTaskMy(paramMap);
				mv.addObject("pno", pno);
			}
			System.out.println("업무 리스트 : " + task);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("tasklist", task);
		mv.addObject("listsize", task.size());
		mv.setViewName("project/ptask");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/taskmy")
	public List<TaskDto> ptaskmy(HttpServletRequest request, Authentication authentication, String pno)
			throws Exception {
		System.out.println(pno + "pno 잘 들어오는지?");
		HashMap<String, String> paramMap = new HashMap<String, String>();
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uname = userdetail.getUname();
		paramMap.put("pno", pno);
		paramMap.put("uname", uname);
		

		List<TaskDto> list = null;
		try {
			list = taskService.PListTaskMy(paramMap);
			System.out.println("모든업무 : " + list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/taskrequire")
	public List<TaskDto> ptaskrequire(Authentication authentication, HttpServletRequest request, String pno)
			throws Exception {
		System.out.println(pno + "pno 잘 들어오는지?");

		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uname = userdetail.getUname();

		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("pno", pno);
		paramMap.put("uname", uname);
		List<TaskDto> list = null;
		try {
			list = taskService.PListTaskRequire(paramMap);
			System.out.println("요청업무 : " + list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/taskall")
	public List<TaskDto> ptaskall(HttpServletRequest request, String pno) throws Exception {
		System.out.println(pno + "pno 잘 들어오는지?");
		List<TaskDto> list = null;
		try {
			list = taskService.PListTaskAll(pno);
			System.out.println("모든업무 : " + list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

//	@RequestMapping(value = "/project/ptask", method = RequestMethod.GET)
//	public ModelAndView pprojectDetail(ModelAndView mv, @RequestParam(name = "pno") String pno, UsersDto dto,
//			TaskDto Tdto, @RequestParam(name = "bno") int bno,
//			@RequestParam(value = "mcount", required = false) String mcount) {
//		/* String pno = "2"; */
//		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
//				.getPrincipal();
//		String cno = user.getCno();
//		String uno = user.getUno();
//		BoardAllDto Bdto = new BoardAllDto();
//		List<ReplyDto> rlist = new ArrayList<ReplyDto>();
//		List<ReplyDto> rclist = new ArrayList<ReplyDto>();
//		List<TaskDto> list = new ArrayList<TaskDto>();
//		List<ProjectMemberDto> ulist = new ArrayList<ProjectMemberDto>();
//
//		Bdto.setBno(bno);
//		Bdto.setPno(pno);
//		dto.setPno(pno);
//		dto.setCno(cno);
//		dto.setUno(uno);
//		List<UsersDto> pmlist = new ArrayList<UsersDto>();
//		int userListSize = 0;
//		// 업무글리스트 list = taskService.PListTaskRequire(paramMap);
//		list = taskService.selectOne(Bdto);
//		try {
//		System.out.println("요청업무 : " + list);
//		System.out.println("글 blist" + list + "글 blist");
//	}catch(
//
//	Exception e)
//	{
//		// 댓글리스트
//		rlist = replyService.ListReply(pno);
//		System.out.println("글 replylist" + rlist + "글 replylist");
//		// 댓글 카운트수
//		rclist = replyService.ReplyCount(pno);
//		System.out.println("댓글 카운트 list" + rclist);
//		// 프로젝트 유저리스트
//		ulist = usersService.listProjectMember(pno);
//		System.out.println("프로젝트 user 리스트" + ulist);
//		userListSize = ulist.size();
//		// 프로젝트 초대 리스트
//		pmlist = usersService.projectInviteList(dto);
//		System.out.println("프로젝트 초대 리스트:" + pmlist);
//		// 은실 임의로 넣음
//		mv.addObject("blist", commonboardservice.getCommonboard());
//		mv.addObject("file", commonboardservice.getFileboard(pno));
//	}catch(Exception e) {
//		e.printStackTrace();
//	}
//		mv.addObject("rclist",rclist);
//		mv.addObject("pmlist", pmlist);
//		mv.addObject("tasklist", list);
//		mv.addObject("replylist", rlist);
//		mv.addObject("userlist", ulist);
//		mv.addObject("userListSize", userListSize);
//		
//		mv.addObject("userSize", userListSize - 1);
//		if (mcount != null) {
//			mv.addObject("inviteSuccess", "프로젝트에 " + mcount + "명이 초대되었습니다");
//		}
//		mv.addObject("pno", pno);
//		mv.setViewName("project/ptask_test");
//		
//		return mv;
//		
//	}
	
	
			
	

}