package com.kh.ontact.chatmember.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.chatmember.model.dao.ChatMemberDao;
import com.kh.ontact.chatmember.model.dto.ChatMemberDto;
import com.kh.ontact.users.model.dto.UsersDto;

@Service("chatMemService")
public class ChatMemberServiceImpl implements ChatMemberService{
	@Autowired
	private ChatMemberDao chatMemDao;
	

	@Override
	public int insertChatMember(ChatMemberDto c) throws Exception {
		return chatMemDao.insertChatMember(c);
	}

}
