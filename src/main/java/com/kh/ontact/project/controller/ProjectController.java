package com.kh.ontact.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.project.model.dto.ProjectDto;
import com.kh.ontact.project.model.service.ProjectService;
import com.kh.ontact.projectDept.model.dto.ProjectDeptDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;

import net.sf.json.JSONObject;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService pjService;
	
	//프로젝트 전체목록
    @RequestMapping(value = "/project/all/list", method = RequestMethod.GET)
    public ModelAndView selectListProject(ModelAndView mv) {
        try {
            mv.addObject("listpj", pjService.selectListProject());
            System.out.println("*******" + pjService.selectListProject());
            mv.setViewName("users/project/projectall");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
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
