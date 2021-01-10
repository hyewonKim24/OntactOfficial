package com.kh.ontact.chatalert.model.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.chatalert.model.dto.ChatAlertDto;

@Repository("chatalertDao")
public class ChatAlertDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	public int insertChatAlertDefault(ChatAlertDto dto) throws Exception{
		return sqlSession.insert("ChatAlert.insertChatAlertDefault", dto);
	}
	public int insertChatAlert(ChatAlertDto dto) throws Exception{
		return sqlSession.insert("ChatAlert.insertChatAlert", dto);
	}
	public int updateChatAlertPlus(ChatAlertDto dto) throws Exception{
		return sqlSession.update("ChatAlert.updateChatAlertPlus", dto);
	}
	public int updateChatAlertReset(ChatAlertDto dto) throws Exception{
		return sqlSession.update("ChatAlert.updateChatAlertReset", dto);
	}
	public int EachChatAlert(ChatAlertDto dto) throws Exception{
		return sqlSession.selectOne("ChatAlert.EachChatAlert", dto);
	}
	public int AllChatAlert(String uno) throws Exception{
		return sqlSession.selectOne("ChatAlert.AllChatAlert", uno);
	}
	
	
}
