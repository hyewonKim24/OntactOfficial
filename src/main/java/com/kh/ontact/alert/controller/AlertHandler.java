package com.kh.ontact.alert.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class AlertHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		//맵 쓸때 sessions.put(session.getId(), session)
		//List 사용할때 
		sessionList.add(session);
		//세션값을 불러온 0번째 중괄호에 session.getId()를 넣으라는 뜻임.
		System.out.println(session.getId()+"연결됨 / 알림소켓 ");
	}
	
	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("알림 메시지 보내기 들어옴");
		String senderId =session.getPrincipal().getName(); 
		// 특정 유저에게 보내기
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null) {
				String pno = strs[0];
				
				 for(WebSocketSession sess : sessionList){
			            sess.sendMessage(new TextMessage(pno+"프로젝트에서"+senderId+"가 글을 1개 등록했습니다"));
			       }
				
			}
		}
	}
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		//List 삭제
		sessionList.remove(session);
		
		System.out.println(session.getId()+"연결 끊김 alert");
	//	System.out.println("채팅방 퇴장자:"+session.getPrincipal().getName());
	}
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}
}
