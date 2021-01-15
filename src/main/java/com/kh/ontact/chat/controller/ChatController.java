package com.kh.ontact.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.chat.model.dao.ChatDao;
import com.kh.ontact.chat.model.dto.ChatDto;
import com.kh.ontact.chat.model.service.ChatService;
import com.kh.ontact.chatalert.model.dto.ChatAlertDto;
import com.kh.ontact.chatalert.model.service.ChatAlertService;
import com.kh.ontact.chatcontent.model.dto.ChatContentDto;
import com.kh.ontact.chatcontent.model.service.ChatContentService;
import com.kh.ontact.chatmember.model.dto.ChatMemberDto;
import com.kh.ontact.chatmember.model.service.ChatMemberService;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.model.service.UsersService;


@Controller
@RequestMapping(value="/chat")
public class ChatController {
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private ChatMemberService chatMemService;
	
	@Autowired
	private ChatContentService chatConService;
	
	@Autowired
	private ChatAlertService chatalertService;
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value="/chatinvite",method=RequestMethod.GET)
	public ModelAndView chatinvite(ModelAndView mv, UsersDto dto) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String cno=user.getCno();
		String uno=user.getUno();
		dto.setCno(cno);
		dto.setUno(uno);
		List<UsersDto> ulist=null;
		List<ChatDto> clist =null;
		try {
			ulist=usersService.ChatUsersList(dto);

		}catch(Exception e) {
			e.printStackTrace();
		}
		mv.addObject("ulist", ulist);
		mv.setViewName("main/chatinvite");
		return mv;
	}
	
	//1대1채팅-채팅방만들기, chatmember추가
	@RequestMapping(value="/chatroom")
	public ModelAndView mychatadd(@RequestParam(name = "chatuno") String chatuno,
		@RequestParam(name = "chatuname") String chatuname,ChatMemberDto mdto,ChatDto dto,ChatAlertDto adto,
		Authentication authentication,ModelAndView mv ) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno=userdetail.getUno();
		String uname=userdetail.getUname();
		mdto.setUno(uno);
		mdto.setCreatchat(1);
		adto.setUno(uno);
		System.out.println("내 uno"+uno);
		
		String chatname=uname+","+chatuname;
		String chatno=null;
		
		ChatMemberDto cdto = new ChatMemberDto();
		List<String> chatnoList = new ArrayList<String>();
		cdto.setUno(uno);
		cdto.setCuno(chatuno);
		
		try {
			//채팅방이 있으면 해당 채팅방으로
			chatnoList = chatMemService.SearchChatno(cdto);
			System.out.println("채팅방번호 리스트"+chatnoList);
			if(!chatnoList.isEmpty()) {
				//채팅방이 있을 때
				System.out.println("우선 여기 들어옴");
				String chatno1=null;
				for(String a : chatnoList) {
					int count = chatMemService.chatmemCount(a);
					if(count==2) {
						chatno1=a;
						System.out.println("채팅방 번호 : "+a);
						mv.addObject("chatno",chatno1);
						mv.setViewName("redirect:/chat/chatroomdetail");
					}else {
						//채팅방이 없으면 채팅방 만들기
						chatno = chatService.insertChat(chatname);
						System.out.println(chatno+"chat insert");
						mdto.setChatno(chatno);
						adto.setChatno(chatno);
						System.out.println("mdto:"+mdto);
			 			int rs =chatMemService.insertChatMember(mdto);
			 			int alertrs = chatalertService.insertChatAlertDefault(adto);
						
						mv.addObject("chatuno",chatuno);
						mv.addObject("chatname",chatname);
						mv.addObject("chatno",chatno);
						mv.setViewName("redirect:/chat/otherchatadd");
					}
				}
				
			}else {
			//채팅방이 없으면 채팅방 만들기
			System.out.println("새로운 채팅방 만들기! ");
			String chatno2 = chatService.insertChat(chatname);
			System.out.println(chatno+"chat insert");
			mdto.setChatno(chatno2);
			adto.setChatno(chatno2);
			System.out.println("mdto:"+mdto);
 			int rs =chatMemService.insertChatMember(mdto);
 			int alertrs = chatalertService.insertChatAlertDefault(adto);
			
			mv.addObject("chatuno",chatuno);
			mv.addObject("chatname",chatname);
			mv.addObject("chatno",chatno2);
			mv.setViewName("redirect:/chat/otherchatadd");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
		
		
	}
	//그룹채팅방 만들기 -> 우선 조건 x 그냥 insert만 시켜보기
	@RequestMapping(value="/chatinvite")
	public ModelAndView chatinvite(@RequestParam(name = "chatuno") List<String> chatuno,
			@RequestParam(name = "chatuname") List<String> chatuname,ChatMemberDto mdto,ChatDto dto,ChatAlertDto adto,
			Authentication authentication,ModelAndView mv ) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno=userdetail.getUno();
		String uname=userdetail.getUname();
		mdto.setUno(uno);
		mdto.setCreatchat(1);
		adto.setUno(uno);
		System.out.println("내 uno"+uno);
		
		System.out.println("그룹채팅 uno:"+chatuno);
		System.out.println(chatuno.size()+"사람수");
		int mcount =chatuno.size()+1;
		String chatname="그룹채팅("+mcount+")";
		String chatno=null;

		List<ChatMemberDto> listdto= new ArrayList<ChatMemberDto>();
		List<ChatAlertDto> listadto= new ArrayList<ChatAlertDto>();
		ChatMemberDto gdto = null;
		ChatAlertDto gadto = null;
		
		try {
			//채팅방이 없으면 채팅방 만들기 + 내 uno 멤버 insert.
			chatno = chatService.insertChat(chatname);
			System.out.println(chatno+"chat insert");
			mdto.setChatno(chatno);
			adto.setChatno(chatno);
			System.out.println("mdto:"+mdto);
 			int rs =chatMemService.insertChatMember(mdto);
 			int alertrs = chatalertService.insertChatAlertDefault(adto);
 			System.out.println(rs+"채팅방 인서트 추가");
 			System.out.println(alertrs+"채팅방 알림추가");
 			
 			int mrs =0;
			for(String a : chatuno) {
				gdto = new ChatMemberDto();
				gdto.setUno(a);
				gdto.setCreatchat(0);
				gdto.setChatno(chatno);
				gadto.setUno(a);
				listadto.add(gadto);
				listdto.add(gdto);
			}
			for(int i=0;i<=listdto.size();i++) {
				mrs =chatMemService.insertChatMember(listdto.get(i)); 
				System.out.println(mrs+" 그룹채팅 여러명추가");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("chatuno",chatuno);
		mv.addObject("chatname",chatname);
		mv.addObject("chatno",chatno);
		mv.setViewName("main/chatroom");
		/* mv.setViewName("redirect:/chat/otherschatadd"); */
		return mv;
	}
	
	//나 외 다른 사람 채팅멤버추가
	@RequestMapping(value="/otherchatadd")
	public ModelAndView otherchatadd(@RequestParam(name = "chatuno") String chatuno,
		@RequestParam(name = "chatname") String chatname,
		@RequestParam(name = "chatno") String chatno,ChatMemberDto mdto, ChatAlertDto adto, ModelAndView mv ) {
		System.out.println("상대 uno"+chatuno);
		mdto.setUno(chatuno);
		mdto.setCreatchat(0);
		adto.setUno(chatuno);
		adto.setChatno(chatno);
		
		try {
 			int rs =chatMemService.insertChatMember(mdto);
 			System.out.println(rs+"채팅멤버 추가");
			int alertrs = chatalertService.insertChatAlertDefault(adto);
			System.out.println(alertrs+"alert insert2");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("chatname",chatname);
		mv.addObject("chatno",chatno);
		mv.setViewName("main/chatroom");
		return mv;
	}
	
	// 그룹채팅) 나 외 다른 사람 여러명 채팅멤버추가
		@RequestMapping(value="/otherschatadd")
		public ModelAndView otherschatadd(@RequestParam(name = "chatuno") List<String> chatuno,
			@RequestParam(name = "chatname") String chatname,
			@RequestParam(name = "chatno") String chatno,List<ChatMemberDto> mdto, List<ChatAlertDto> adto, ModelAndView mv ) {
			System.out.println("상대 uno list"+chatuno);
			System.out.println("채팅방 번호"+chatno);
			ChatMemberDto dto = null;
			/*
			 * adto.setUno(chatuno); adto.setChatno(chatno);
			 */
			
			try {
				int rs =0;
					for(String a : chatuno) {
						dto = new ChatMemberDto();
						dto.setUno(a);
						dto.setCreatchat(0);
						/* rs =chatMemService.insertChatMember(dto); */
					}
	 			System.out.println(rs+"채팅멤버 추가");
				/*
				 * 알림 부분
				 * int alertrs = chatalertService.insertChatAlertDefault(adto);
				 * System.out.println(alertrs+"alert insert2");
				 */
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.addObject("chatname",chatname);
			mv.addObject("chatno",chatno);
			mv.setViewName("main/chatroom");
			return mv;
		}
	
	//메시지 추가 + 채팅 알림 추가
	@RequestMapping(value="/contentadd" ,method = {RequestMethod.GET, RequestMethod.POST})
	public void contentadd(String uno,String chatno,String message,
			ChatContentDto dto, ModelAndView mv, ChatAlertDto adto,ChatMemberDto mdto ) {
		
		dto.setChatno(chatno);
		dto.setContent(message);
		dto.setUno(uno);
		adto.setChatno(chatno);
		mdto.setUno(uno);
		mdto.setChatno(chatno);
		List<String> list= new ArrayList<String>();
		System.out.println("uno:"+uno+"chatno:"+chatno+message+"메세지");
		try {
			int rs=chatConService.insertChatContent(dto);
			System.out.println(rs+"채팅 : content추가");
			
			//채팅알림관련
			list=chatMemService.chatUnoList(mdto);
			for(String i : list) {
			String chatuno=i;
			adto.setUno(chatuno);
			int alertrs=chatalertService.updateChatAlertPlus(adto);
			System.out.println(chatuno+"에게"+alertrs +"채팅알림추가");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//해당 chatno방으로 입장
	@SuppressWarnings("null")
	@RequestMapping(value="/chatroomdetail")
	public ModelAndView chatroomdetail(@RequestParam(name = "chatno") String chatno,
			ChatMemberDto mdto,ChatDto dto, ChatAlertDto adto,Authentication authentication, ModelAndView mv ) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno=userdetail.getUno();
		
		System.out.println("chatno:"+chatno);
		List<ChatContentDto> mylist=null;
		List<ChatContentDto> conlist=null;
		String chatname=null;
		mdto.setChatno(chatno);
		mdto.setUno(uno);
		adto.setChatno(chatno);
		adto.setUno(uno);
		
		try {
			conlist=chatConService.otherlistChatContent(mdto);
			System.out.println("내용 list:"+conlist);
			chatname=chatService.selectchatname(chatno);
			System.out.println("chatname:"+chatname);
			int rs=chatalertService.updateChatAlertReset(adto);
			System.out.println("알림 카운트 reset"+rs);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("chatname",chatname);
		mv.addObject("uno",uno);
		mv.addObject("chatno",chatno);
		mv.addObject("mylist",mylist);
		mv.addObject("conlist",conlist);
		mv.setViewName("main/chatroom");
		return mv;
	}

	

}
