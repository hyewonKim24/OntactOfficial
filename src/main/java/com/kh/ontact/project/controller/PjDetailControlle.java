package com.kh.ontact.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllViewDto;
import com.kh.ontact.project.boardall.model.service.BoardAllService;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.users.model.service.UsersService;

@Controller
public class PjDetailControlle {
	@Autowired
	private BoardAllService ballService;
	@Autowired
	private UsersService usersService;
	
	//윤진 : ProejctDetail 전체리스트
	@RequestMapping(value="project/pjdetail", method=RequestMethod.GET)
	public ModelAndView selectListPjDetail(ModelAndView mv, @RequestParam(name="pno") String pno) {
		System.out.println("blist 컨트롤러 진입");
		BoardAllDto badto= new BoardAllDto();
		badto.setPno(pno);
		List<BoardAllViewDto> blist = new ArrayList<BoardAllViewDto>();
		List<ProjectMemberDto> ulist= new ArrayList<ProjectMemberDto>();
        
		try {
		blist = ballService.selectListPjDetail(pno);
		System.out.println("blist:"+blist );
		 //프로젝트 유저리스트
        ulist=usersService.listProjectMember(pno);
        System.out.println("프로젝트 user 리스트"+ulist);

        mv.addObject("pno",pno);
		mv.addObject("blist", blist);
		mv.addObject("userlist", ulist);

		mv.setViewName("project/pjdetail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
