package com.kh.ontact.chat.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.model.service.UsersService;


@Component
public class EchoHandler extends TextWebSocketHandler{
//핸들러 클래스를 구성해야 클라이언트를 관리. 기본적으로 단일연결, 복수연결이 있음.
//크게 3가지(연결-데이터 전송-종료)메소드로 구성됨.
	@Autowired
	UsersService usersService;
	
	List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
	
	//소켓 연결
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		super.afterConnectionEstablished(session);
		boolean flag = false;
		String url = session.getUri().toString();
		System.out.println(url);
		String chatno = url.split("/echo/")[1];
		System.out.println("에코 핸들러 chatno:"+chatno);
		int idx = list.size();
		if(list.size()>0) {
				for(int i=0;i<list.size();i++) {
					String chatno2 = (String) list.get(i).get("chatno");
					if(chatno2.equals(chatno)) {
						flag=true;
						idx=i;
						break;
					}
				}
		}
		if(flag) { //존재하는 채팅방이라면
			HashMap<String, Object> map = list.get(idx);
			map.put(session.getId(),session);
			list.add(map);
		}else { //최초 생성하는 방이라면
			HashMap<String, Object> map= new HashMap<String, Object>();
			map.put("chatno", chatno);
			map.put(session.getId(),session);
			list.add(map);
		}
		
		//세션 등록이 끝나면 발급받은 세션 ID값의 메시지를 발송.
	}
	
	//메시지발송
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String strs[] = message.getPayload().split(",");
		String chatno = strs[0];
		System.out.println("메시지 chatno:"+chatno);
		String msg = strs[1];
		String uemail = session.getPrincipal().getName();
		UsersDto dto = usersService.ChatUserDetail(uemail);
		String name=dto.getUname();
		
		HashMap<String, Object> temp = new HashMap<String, Object>();
		
		if(list.size()>0) {
			for(int i=0;i<list.size();i++) {
				String chatno2 = (String) list.get(i).get("chatno");
				if(chatno2.equals(chatno)) {
					temp=list.get(i);
					break;
				}
			}
			for(String k : temp.keySet()) {
				if(k.equals("chatno")) {
					continue;
				}
				WebSocketSession wss =(WebSocketSession) temp.get(k);
				if(wss != null) {
					try {
						wss.sendMessage(new TextMessage(name+" | "+msg));
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	//소켓 종료
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		if(list.size()>0) {
			for(int i=0;i<list.size();i++) {
				list.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
		
		System.out.println(session.getId()+"연결 끊김 echo");
		System.out.println("채팅방 퇴장자:"+session.getPrincipal().getName());
	}
}
