package com.kh.ontact.chat.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.ontact.chatalert.model.service.ChatAlertService;
import com.kh.ontact.users.model.dto.CustomUserDetails;


//미구현
public class ChatAlertHandler extends TextWebSocketHandler{
	@Autowired
	ChatAlertService chatalertService;
	
	Map<String, WebSocketSession> userSessions  = new HashMap<String, WebSocketSession>();
	
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		String uno = getUno(session);
		userSessions.put(uno, session);
		System.out.println(session.getId()+"연결됨 채팅알람~~핸들러");
	}
	
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String uno = getUno(session);
		
		
	}
	
	private String getUno(WebSocketSession session) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String uno = user.getUno();
		return uno;
	}
	
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		userSessions.remove(session);
		System.out.println(session.getId()+"연결 끊김 chat alert");
	}
}
