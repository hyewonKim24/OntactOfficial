package com.kh.ontact.chatcontent.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.chatcontent.model.dto.ChatContentDto;
import com.kh.ontact.chatmember.model.dto.ChatMemberDto;

@Repository("chatconDao")
public class ChatContentDao {
	@Autowired
	private SqlSession sqlSession;

	public List<ChatContentDto> mylistChatContent(ChatMemberDto dto){
		return sqlSession.selectList("ChatContent.mylistChatContent", dto);
	}
	public List<ChatContentDto> otherlistChatContent(ChatMemberDto dto){
		return sqlSession.selectList("ChatContent.otherlistChatContent", dto);
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
