package com.kh.ontact.chatcontent.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.chatcontent.model.dto.ChatContentDto;

@Repository("chatconDao")
public class ChatContentDao {
	@Autowired
	private SqlSession sqlSession;

	public List<ChatContentDto> listChatContent(String chatno){
		return sqlSession.selectList("ChatContent.listChatContent", chatno);
	}
	public int insertChatContent(ChatContentDto c){
		return sqlSession.insert("ChatContent.insertChatContent",c);
	}
	public int insertChatimg(ChatContentDto c){
		return sqlSession.insert("ChatContent.insertChatimg",c);
	}
	public int fixChatContent(ChatContentDto c){
		return sqlSession.update("ChatContent.fixChatContent",c);
	}
	
}
