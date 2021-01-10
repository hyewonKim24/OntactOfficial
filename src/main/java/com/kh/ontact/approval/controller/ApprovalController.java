package com.kh.ontact.approval.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.approval.model.dto.ApprovalDto;
import com.kh.ontact.approval.model.service.ApprovalService;

@Controller
public class ApprovalController {
	
	@Autowired
	ApprovalService ApproService;
	
	public static final int LIMIT = 10;
	

	@RequestMapping(value = "/driftform" , method = RequestMethod.GET)
	public String driftform(ModelAndView mv) {
		return "users/approval/driftform";
	}
	@RequestMapping(value = "/insert" , method = RequestMethod.POST)
	public ModelAndView insertApproval(ApprovalDto dto, @RequestParam(required = false) 
	HttpServletRequest request, ModelAndView mv) throws Exception {
		ApproService.insertApproval(dto);
		mv.setViewName("redirect:driftform");
		return mv;
	}
	
//	@RequestMapping(value = "/guestjoin", method = RequestMethod.POST)
//	public String insertApproval(@RequestParam ApprovalDto ApprovalDto) {
//		
//		try {
//			ApproService.insertApproval(ApprovalDto);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/driftform";
//	}
}
