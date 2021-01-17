package com.kh.ontact.project.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.dept.model.dto.DeptDto;
import com.kh.ontact.dept.model.service.DeptService;
import com.kh.ontact.project.model.dto.ProjectDto;
import com.kh.ontact.project.model.service.ProjectService;
import com.kh.ontact.projectDept.model.dto.ProjectDeptDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.users.model.dto.CustomUserDetails;

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
			mv.setViewName("project/projectall");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 미보관 프로젝트 목록
	@RequestMapping(value="/project/uns/list", method = RequestMethod.GET)
	public ModelAndView selectListProjectUns(ModelAndView mv, Authentication authentication, HttpServletResponse response) {
		try {
		response.setContentType("text/html;charset=UTF-8");
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno = userdetail.getUno();
		System.out.println("내 uno" + uno);
		
		mv.addObject("pjuns",pjService.selectListPjUns(uno));
		mv.setViewName("project/pjuns");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return mv;
	}
	
	//부서별  보관함 프로젝트 리스트
	@RequestMapping(value="/project/pjteam/list", method = RequestMethod.GET)
	public ModelAndView selectListPjTeam(ModelAndView mv, 
			Authentication authentication, 
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "dname", required = false) String dname) {
		System.out.println("dname : "+ dname);
		try {
			response.setContentType("text/html;charset=UTF-8");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno = userdetail.getUno();
			System.out.println("내 uno" + uno);

			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("uno", uno);
			paramMap.put("dname", dname);
			System.out.println("paramMap:"+paramMap);
			
			mv.addObject("pjteam", pjService.selectListPjTeam(paramMap));
			mv.addObject("dname", dname);
			mv.setViewName("project/pjteam");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 사이드바 : 프로젝트 생성 모달 클릭 시 부서 보관함 목록  & 사이드바 부서보관함 목록
	@RequestMapping(value = "/project/pjteam")
	@SuppressWarnings("finally")
	@ResponseBody
	public Object selectListDeptDname(Authentication authentication) {
		List<DeptDto> dept = new ArrayList<DeptDto>();
		try {
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String cno = userdetail.getCno();
			System.out.println("내 cno" + cno);
			
			dept = deptServ.selectListDept(cno);
			System.out.println("부서보관함 목록: "+ dept);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return dept;
		}
	}

	//사이드바 : 프로젝트 생성
	@SuppressWarnings("finally")
	@RequestMapping(value="/project/all/ins", method=RequestMethod.GET)
	public String insertProject(ProjectDto pj, ProjectMemberDto pjm, ProjectDeptDto pjd, 
			HttpServletRequest request, RedirectAttributes rttr, Authentication authentication,
			@RequestParam(value="pname", required=true) String pname, 
			@RequestParam(value="pdesc", required=false) String pdesc, 
			@RequestParam(value="popen", defaultValue="1", required=false) int popen, 
			@RequestParam(value="dno", required=false) String dno){
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno = userdetail.getUno();
		
		System.out.println("프로젝트 insert controller 진입");
		System.out.println("pname: "+pname+" pdesc:"+pdesc+ " uno:"+uno);
		System.out.println("dno" + dno);
		try {
			if(pname != null) {
				System.out.println("insert if문 진입");
				pj.setPname(pname);
				pj.setPdesc(pdesc);
				pj.setPopen(popen);
				pjm.setUno(uno);
				pjd.setDno(dno);
				System.out.println("pj_"+pj+"pjm_"+pjm+"pjd_"+pjd);
				pjService.insertProject(pj, uno, dno);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			return "redirect:list";
		}
	}
}