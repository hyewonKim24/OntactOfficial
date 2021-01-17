package com.kh.ontact.header.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.alert.model.dto.AlertDto;
import com.kh.ontact.alert.model.service.AlertService;
import com.kh.ontact.chat.model.dto.ChatDto;
import com.kh.ontact.chatalert.model.dto.ChatAlertDto;
import com.kh.ontact.chatalert.model.service.ChatAlertService;
import com.kh.ontact.chatcontent.model.dto.ChatContentDto;
import com.kh.ontact.chatmember.model.dto.ChatMemberDto;
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
	
	@Autowired
	private ChatAlertService chatalertService;
	
	@Autowired
	private AlertService alertService;
	
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
		Integer count=0;
		try {
			ulist=usersService.ChatUsersList(dto);
			System.out.println("header controller"+ulist);
			
			clist=chatMemService.mychatlist(uno);
			count=chatalertService.AllChatAlert(uno);
			if(count==null)
				count=0;
			System.out.println("채팅count:"+count);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("alertcount", count);
		mv.addObject("cno", cno);
		mv.addObject("uno", uno);
		mv.addObject("ulist", ulist);
	//	mv.addObject("clist", clist);
		mv.setViewName("main/header");
		return mv;
	}
	@RequestMapping(value="/headertest",method=RequestMethod.GET)
	public ModelAndView headerTEST(ModelAndView mv,Authentication authentication,UsersDto dto) {
		mv.setViewName("main/header");
		return mv;
	}
	
	//채팅리스트 ajax로 뿌리기
	@ResponseBody
	@RequestMapping(value="/chatlist" ,method = {RequestMethod.GET, RequestMethod.POST})
	public List<ChatDto> chatlist(ModelAndView mv,Authentication authentication) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno=userdetail.getUno();
		List<ChatDto> clist =null;
		try {
			clist=chatMemService.mychatlist(uno);
			System.out.println(clist+"ajax요청");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return clist;
	}
	//유저리스트 ajax로 뿌리기
	@ResponseBody
	@RequestMapping(value="/userlist" ,method = {RequestMethod.GET, RequestMethod.POST})
	public List<UsersDto> userlist(ModelAndView mv,Authentication authentication,UsersDto dto) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String cno=userdetail.getCno();
		String uno=userdetail.getUno();
		dto.setCno(cno);
		dto.setUno(uno);
		List<UsersDto> ulist=null;
		try {
			ulist=usersService.ChatUsersList(dto);
			//System.out.println("header controller"+ulist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ulist;
	}
	
	//채팅 전체 알림수 
	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping(value="/chatalertall" ,method = {RequestMethod.GET, RequestMethod.POST})
	public int chatalertAll(ModelAndView mv,Authentication authentication) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno=userdetail.getUno();
		Integer count=0;
		try {
			count=chatalertService.AllChatAlert(uno);
			if(count==null) 
				count=0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//알림 카운트 가져오기
	@ResponseBody
	@RequestMapping(value="/alertcount" ,method = {RequestMethod.GET, RequestMethod.POST})
	public int alertcount(ModelAndView mv,Authentication authentication) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno=userdetail.getUno();
		int count=0;
		try {
			count=alertService.alertCount(uno);
			System.out.println("count수:"+count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//미확인 알림 리스트 ajax로 뿌리기
	@ResponseBody
	@RequestMapping(value="/alertlist" ,method = {RequestMethod.GET, RequestMethod.POST})
	public List<AlertDto> alertlist(ModelAndView mv,Authentication authentication,AlertDto dto) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno=userdetail.getUno();
		dto.setUno(uno);
		List<AlertDto> alist = new ArrayList<AlertDto>();
		try {
			alist=alertService.alertNotList(uno);
			System.out.println("알림리스트:"+alist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return alist;
	}
	//전체 알림 리스트 ajax로 뿌리기
	@ResponseBody
	@RequestMapping(value="/alertalllist" ,method = {RequestMethod.GET, RequestMethod.POST})
	public List<AlertDto> alertalllist(ModelAndView mv,Authentication authentication,AlertDto dto) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno=userdetail.getUno();
		dto.setUno(uno);
		List<AlertDto> alist = new ArrayList<AlertDto>();
		try {
			alist=alertService.alertAllList(uno);
			System.out.println("알림 전체 리스트:"+alist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return alist;
	}
	//알림 전체 읽음
		@ResponseBody
		@RequestMapping(value="/alertallread" ,method = {RequestMethod.GET, RequestMethod.POST})
		public List<AlertDto> alertallread(ModelAndView mv,Authentication authentication,AlertDto dto) {
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			System.out.println("알림 전체 읽음 들어옴");
			String uno=userdetail.getUno();
			dto.setUno(uno);
			List<AlertDto> alist = new ArrayList<AlertDto>();
			try {
				alist = alertService.alertAllRead(uno);
				System.out.println("모두 읽음 후 알림리스트:"+alist);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return alist;
		}
	
	
}
