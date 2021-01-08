package com.kh.ontact.chat.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.kh.ontact.chat.model.dto.ChatDto;
import com.kh.ontact.chat.model.service.ChatService;
import com.kh.ontact.chatmember.model.service.ChatMemberService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@Repository
public class ChatRoomRepository {
//	@Autowired
//	private ChatMemberService chatMemService;
//	@Autowired
//	private ChatService chatService;
//	
//	CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//	String uno = user.getUno();
//	String uname = user.getUname();
//	
//	private Map<String, ChatDto> chatRoomMap;
//	
//	@PostConstruct
//	private void init() {
//		chatRoomMap = new LinkedHashMap<>();
//	}
//	
//	//내 uno가 포함된 채팅방 찾기
//	public List<ChatDto> findAllRoom(){
//		List<ChatDto> clist = null;
//		
//		try {
//			clist=chatMemService.mychatlist(uno);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return clist;
//	}
//	
//	//해당 메세지를 받아서 해당 chatno에 insert
//	public ChatDto findRoomById(String id) {
//		return chatRoomMap.get(id);
//	}
//	
//	//방 생성후 채팅방번호 보내기
//	public String createChatRoom(String name) {
//		ChatDto chat = null;
//		String chatname=uname+","+name;
//		chat.setChatname(chatname);
//		String chatno =null;
//		try {
//			chatno = chatService.insertChat(chatname);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return chatno;
//	}

}
