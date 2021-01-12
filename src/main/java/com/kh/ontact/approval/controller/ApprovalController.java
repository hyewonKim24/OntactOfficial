package com.kh.ontact.approval.controller;

import java.util.ArrayList;
import java.util.List;

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
	

	@RequestMapping(value = "driftlist" , method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public ModelAndView approvalService(@RequestParam(name = "keyword", required = false) ModelAndView mv) {
		
		int listCount = ApproService.totalCount();
//		mv.addObject("listCount", listCount);
//		mv.addObject(ApproService.selectList());
		mv.setViewName("users/approval/driftlist");
		return mv;
	}
	
	@RequestMapping(value = "/driftform" , method = RequestMethod.GET)
	public String driftform(ModelAndView mv) {
		return "users/approval/driftform";
	}
	
	@RequestMapping(value = "/appinsert" , method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public ModelAndView insertApproval(ApprovalDto dto, @RequestParam(required = false) 
	HttpServletRequest request, ModelAndView mv) throws Exception {
		
		System.out.println("insert들어옴");
		ApproService.insertApproval(dto);
		
		mv.setViewName("redirect:main");
		return mv;
	}
	
	
	

}
