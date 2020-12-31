package com.kh.ontact.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.chat.model.dto.ChatDto;

@Repository("chatDao")
public class ChatDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ChatDto> listCaht(){
		return sqlSession.selectList("Chat.listChat");
	}
	public int insertChat(ChatDto c) {
		return sqlSession.insert("Chat.insertChat",c);
	}
	public int insertProChat(ChatDto c) {
		return sqlSession.insert("Chat.insertProChat",c);
	}
	public int deleteChat(String chatno) {
		return sqlSession.insert("Chat.deleteChat",chatno);
	}

}
