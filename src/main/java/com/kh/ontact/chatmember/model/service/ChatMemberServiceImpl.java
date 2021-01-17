package com.kh.ontact.chatmember.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.chat.model.dto.ChatDto;
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

	@Override
	public List<ChatDto> mychatlist(String uno) throws Exception {
		return chatMemDao.mychatlist(uno);
	}

	@Override
	public List<ChatDto> searchchatlist(HashMap<String, String> map) throws Exception {
		return chatMemDao.searchchatlist(map);
	}

	@Override
	public List<String> chatUnoList(ChatMemberDto c) throws Exception {
		return chatMemDao.chatUnoList(c);
	}

	@Override
	public List<String> SearchChatno(ChatMemberDto c) throws Exception {
		return chatMemDao.SearchChatno(c);
	}

	@Override
	public int chatmemCount(String chatno) throws Exception {
		return chatMemDao.chatmemCount(chatno);
	}

	@Override
	public List<String> chatmemName(String chatno) throws Exception {
		return chatMemDao.chatmemName(chatno);
	}

}
