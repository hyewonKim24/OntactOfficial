package com.kh.ontact.chatcontent.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.chatcontent.model.dao.ChatContentDao;
import com.kh.ontact.chatcontent.model.dto.ChatContentDto;

@Service("chatConService")
public class ChatContentServiceImpl implements ChatContentService {
	@Autowired
	private ChatContentDao condao;
	
	@Override
	public List<ChatContentDto> listChatContent(String chatno) throws Exception {
		return condao.listChatContent(chatno);
	}

	@Override
	public int insertChatContent(ChatContentDto c) throws Exception {
		return condao.insertChatContent(c);
	}

	@Override
	public int insertChatimg(ChatContentDto c) throws Exception {
		return condao.insertChatimg(c);
	}

	@Override
	public int fixChatContent(ChatContentDto c) throws Exception {
		return condao.fixChatContent(c);
	}

}
