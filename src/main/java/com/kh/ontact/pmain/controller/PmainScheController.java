package com.kh.ontact.pmain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.project.schedule.model.service.ScheduleService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@Controller
public class PmainScheController {
	@Autowired
	private ScheduleService scheduleServ;
	
	@RequestMapping(value = "/projectsche/ins", method = RequestMethod.GET)
	public String insertSchedule(ScheduleDto s, 
					Authentication authentication, RedirectAttributes rttr) {
		try {
			System.out.println("프로젝트 일정 인서트진입");
			
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		    String uno=userdetail.getUno();
		    String dno = userdetail.getDno();
		    System.out.println("세션값확인 : " + uno);
		    
//		    boardallServ.
		    scheduleServ.insertSchedule(s);
			rttr.addFlashAttribute("message", "success");
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		//프로젝트 글 작성 메인페이지 링크로 이동
		return "redirect:/overwork/owlist";
	}
}
