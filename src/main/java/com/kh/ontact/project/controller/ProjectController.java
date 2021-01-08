package com.kh.ontact.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.dept.model.dao.DeptDao;
import com.kh.ontact.dept.model.dto.DeptDto;
import com.kh.ontact.dept.model.service.DeptService;
import com.kh.ontact.project.model.dto.ProjectDto;
import com.kh.ontact.project.model.service.ProjectServiceImpl;
import com.kh.ontact.project.model.service.ProjectService;
import com.kh.ontact.projectDept.model.dto.ProjectDeptDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.users.model.dto.CustomUserDetails;

import net.sf.json.JSONObject;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService pjService;
	@Autowired
	private DeptService deptServ;

	// 프로젝트 전체목록
	@RequestMapping(value = "/project/all/list", method = RequestMethod.GET)
	public ModelAndView selectListProject(ModelAndView mv, Authentication authentication,
			HttpServletResponse response) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno = userdetail.getUno();
			System.out.println("내 uno" + uno);

			mv.addObject("pjc", pjService.selectOneCompany(uno));
			System.out.println("내 회사 결과 : " + pjService.selectOneCompany(uno));
			mv.addObject("pjd", pjService.selectOneTeam(uno));
			System.out.println("내 부서 결과 : " + pjService.selectOneTeam(uno));
			mv.addObject("listpj", pjService.selectListProject(uno));
			System.out.println("project List 결과 : " + pjService.selectListProject(uno));
			mv.setViewName("users/project/projectall");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 프로젝트 생성 모달 : 부서 보관함 목록 뿌리기
	@RequestMapping(value = "/project/all/newpjmodal")
	@SuppressWarnings("finally")
	@ResponseBody
	public Object selectListDeptDname() {
		List<DeptDto> arrList = new ArrayList<DeptDto>();
		try {
			arrList = deptServ.selectListDeptDname();
			System.out.println("부서보관함 목록: "+ arrList);
//    		mv.addObject("dlist", deptServ.selectListDeptDname());
//    		System.out.println("부서보관함 목록: " + deptServ.selectListDeptDname());
//    		mv.setViewName("users/project/pjsidebar");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return arrList;
		}
	}

//	@RequestMapping(value="/project/all/ins", method=RequestMethod.POST)
//	public String insertProject(ProjectDto pj, ProjectMemberDto pjm, ProjectDeptDto pjd,
//			HttpServletRequest request, RedirectAttributes rttr) {
//		try {
//			System.out.println("프로젝트 생성 controller 진입");
//			String pj = request.getParameter("");
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			return ;
//		}
//	}

}
