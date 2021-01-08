package com.kh.ontact.chatcontent.model.service;

import java.util.List;

import com.kh.ontact.chatcontent.model.dto.ChatContentDto;
import com.kh.ontact.chatmember.model.dto.ChatMemberDto;

public interface ChatContentService {
	List<ChatContentDto> mylistChatContent(ChatMemberDto dto) throws Exception;
	List<ChatContentDto> otherlistChatContent(ChatMemberDto dto) throws Exception;
	int insertChatContent(ChatContentDto c) throws Exception;
	int insertChatimg(ChatContentDto c) throws Exception;
	int fixChatContent(ChatContentDto c) throws Exception;
}
