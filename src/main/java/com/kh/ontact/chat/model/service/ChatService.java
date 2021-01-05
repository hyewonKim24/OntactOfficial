package com.kh.ontact.chat.model.service;

import java.util.List;

import com.kh.ontact.chat.model.dto.ChatDto;

public interface ChatService {
	List<ChatDto> listCaht() throws Exception;
	String selectchatname(String chatno) throws Exception;
	String insertChat(String chatname) throws Exception;
	String chatnoSelect() throws Exception;
	int insertProChat(ChatDto c) throws Exception;
	int deleteChat(String chatno) throws Exception ;
}
