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
	
	public List<ChatDto> listCaht() throws Exception{
		return sqlSession.selectList("Chat.listChat");
	}
	public String chatnoSelect() throws Exception{
		return sqlSession.selectOne("Chat.chatnoSelect");
	}
	public String selectchatname(String chatno) throws Exception{
		return sqlSession.selectOne("Chat.selectchatname",chatno);
	}
	public int insertChat(String chatname) throws Exception {
		return sqlSession.insert("Chat.insertChat",chatname);
	}
	public int insertProChat(ChatDto c) throws Exception {
		return sqlSession.insert("Chat.insertProChat",c);
	}
	public int deleteChat(String chatno) throws Exception {
		return sqlSession.insert("Chat.deleteChat",chatno);
	}

}
