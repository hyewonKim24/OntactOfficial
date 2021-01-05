package com.kh.ontact.chatmember.model.service;

import java.util.List;

import com.kh.ontact.chat.model.dto.ChatDto;
import com.kh.ontact.chatmember.model.dto.ChatMemberDto;

public interface ChatMemberService {
	
	int insertChatMember(ChatMemberDto c) throws Exception;
	List<ChatDto> mychatlist(String uno) throws Exception;
	
}
