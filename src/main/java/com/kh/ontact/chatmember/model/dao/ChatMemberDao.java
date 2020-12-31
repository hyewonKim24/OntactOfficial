package com.kh.ontact.chatmember.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.chatmember.model.dto.ChatMemberDto;


@Repository("chatMemDao")
public class ChatMemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int listChatContent(String chatno){
		return sqlSession.selectOne("ChatMember.listChatMCount",chatno);
	}
	//UsersDto 아직..x 
//	public List<UsersDto> listChatMember(String chatno){
//		return sqlSession.selectOne("ChatMember.listChatMember",chatno);
//	}
	public int insertChatMember(ChatMemberDto c){
		return sqlSession.selectOne("ChatMember.insertChatMember",c);
	}
	public int deleteChatMember(ChatMemberDto c){
		return sqlSession.selectOne("ChatMember.deleteChatMember",c);
	}
	
	
}
