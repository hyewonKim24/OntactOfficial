package com.kh.ontact.chatcontent.model.service;

import java.util.List;

import com.kh.ontact.chatcontent.model.dto.ChatContentDto;

public interface ChatContentService {
	List<ChatContentDto> listChatContent(String chatno) throws Exception;
	int insertChatContent(ChatContentDto c) throws Exception;
	int insertChatimg(ChatContentDto c) throws Exception;
	int fixChatContent(ChatContentDto c) throws Exception;
}
