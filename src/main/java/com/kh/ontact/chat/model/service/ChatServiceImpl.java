package com.kh.ontact.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.chat.model.dao.ChatDao;
import com.kh.ontact.chat.model.dto.ChatDto;

@Service("chatService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao chatDao;
	
	@Override
	public List<ChatDto> listCaht() throws Exception{
		return chatDao.listCaht();
	}

	//채팅방 insert하고 chatno 알아나오기
	@Override
	public String insertChat(String chatname) throws Exception{
		int rs = chatDao.insertChat(chatname);
		System.out.println("chat 서비스"+rs);
		String chatno=chatDao.chatnoSelect();
		System.out.println("chat 서비스"+chatno);
		return chatno;
	}

	@Override
	public int insertProChat(ChatDto c) throws Exception{
		return chatDao.insertProChat(c);
	}

	@Override
	public int deleteChat(String chatno) throws Exception {
		return chatDao.deleteChat(chatno);
	}

	@Override
	public String chatnoSelect() throws Exception {
		return chatDao.chatnoSelect();
	}

	@Override
	public String selectchatname(String chatno) throws Exception {
		return chatDao.selectchatname(chatno);
	}
	

}
