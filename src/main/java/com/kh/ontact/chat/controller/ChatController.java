package com.kh.ontact.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.chat.model.dao.ChatDao;
import com.kh.ontact.chat.model.dto.ChatDto;
import com.kh.ontact.chat.model.service.ChatService;
import com.kh.ontact.chatcontent.model.dto.ChatContentDto;
import com.kh.ontact.chatcontent.model.service.ChatContentService;
import com.kh.ontact.chatmember.model.dto.ChatMemberDto;
import com.kh.ontact.chatmember.model.service.ChatMemberService;
import com.kh.ontact.users.model.dto.CustomUserDetails;


@Controller
@RequestMapping(value="/chat")
public class ChatController {
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private ChatMemberService chatMemService;
	
	@Autowired
	private ChatContentService chatConService;
	
	@RequestMapping(value="/chatinvite",method=RequestMethod.GET)
	public ModelAndView chatinvite(ModelAndView mv) {
		mv.setViewName("main/chatinvite");
		return mv;
	}
	
	//1대1채팅-채팅방만들기, chatmember추가
	@RequestMapping(value="/chatroom")
	public ModelAndView mychatadd(@RequestParam(name = "chatuno") String chatuno,
		@RequestParam(name = "chatuname") String chatuname,ChatMemberDto mdto,ChatDto dto,
		Authentication authentication,ModelAndView mv ) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno=userdetail.getUno();
		String uname=userdetail.getUname();
		mdto.setUno(uno);
		mdto.setCreatchat(1);
		System.out.println("내 uno"+uno);
		
		String chatname=uname+","+chatuname;
		String chatno=null;
		
		try {
			//채팅방만들기
			chatno = chatService.insertChat(chatname);
			System.out.println(chatno+"chat insert");
			mdto.setChatno(chatno);
			System.out.println("mdto:"+mdto);
 			int rs =chatMemService.insertChatMember(mdto);
 			System.out.println(rs+"채팅멤버 추가");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("chatuno",chatuno);
		mv.addObject("chatname",chatname);
		mv.addObject("chatno",chatno);
		mv.setViewName("redirect:/chat/otherchatadd");
		return mv;
	}
	
	//나 외 다른 사람 채팅멤버추가
	@RequestMapping(value="/otherchatadd")
	public ModelAndView otherchatadd(@RequestParam(name = "chatuno") String chatuno,
		@RequestParam(name = "chatname") String chatname,
		@RequestParam(name = "chatno") String chatno,ChatMemberDto mdto, ModelAndView mv ) {
		System.out.println("상대 uno"+chatuno);
		mdto.setUno(chatuno);
		mdto.setCreatchat(0);
		
		try {
 			int rs =chatMemService.insertChatMember(mdto);
 			System.out.println(rs+"채팅멤버 추가");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("chatname",chatname);
		mv.addObject("chatno",chatno);
		mv.setViewName("main/chatroom");
		return mv;
	}
	
	//메시지 추가
	@RequestMapping(value="/contentadd" ,method = {RequestMethod.GET, RequestMethod.POST})
	public void contentadd(String uno,String chatno,String message,
			ChatContentDto dto, ModelAndView mv ) {
		
		dto.setChatno(chatno);
		dto.setContent(message);
		dto.setUno(uno);
		System.out.println("uno:"+uno+"chatno:"+chatno+message+"컨트롤러 메세지");
		try {
			int rs=chatConService.insertChatContent(dto);
			System.out.println(rs+"content추가");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
