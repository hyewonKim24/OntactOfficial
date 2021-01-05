package com.kh.ontact.chatmember.model.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.chat.model.dto.ChatDto;
import com.kh.ontact.chatmember.model.dto.ChatMemberDto;


@Repository("chatMemDao")
public class ChatMemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertChatMember(ChatMemberDto c) throws Exception{
		System.out.println("chatmem dao");
		return sqlSession.insert("ChatMember.insertChatMember",c);
	}
	public List<ChatDto> mychatlist(String uno) throws Exception{
		return sqlSession.selectList("ChatMember.mychatlist",uno);
	}
	
	
}
