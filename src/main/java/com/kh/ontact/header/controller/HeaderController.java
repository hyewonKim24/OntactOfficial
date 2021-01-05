package com.kh.ontact.header.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.chat.model.dto.ChatDto;
import com.kh.ontact.chatmember.model.service.ChatMemberService;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.model.service.UsersService;

@Controller
public class HeaderController {
	@Autowired
	private UsersService usersService;
	
//	@Autowired
//	private CompanyService companyService;
	
	@Autowired
	private ChatMemberService chatMemService;
	
	@RequestMapping(value="/header",method=RequestMethod.GET)
	public ModelAndView header(ModelAndView mv,Authentication authentication,UsersDto dto) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String cno=userdetail.getCno();
		String uno=userdetail.getUno();
		String cname=null;
		dto.setCno(cno);
		dto.setUno(uno);
		List<UsersDto> ulist=null;
		List<ChatDto> clist =null;
		try {
			ulist=usersService.ChatUsersList(dto);
			System.out.println("header controller"+ulist);
			
			clist=chatMemService.mychatlist(uno);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("cno", cno);
		mv.addObject("uno", uno);
		mv.addObject("ulist", ulist);
		mv.addObject("clist", clist);
		mv.setViewName("main/header");
		return mv;
	}
}
