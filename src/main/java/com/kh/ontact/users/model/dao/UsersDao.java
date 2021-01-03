package com.kh.ontact.users.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.users.model.dto.UsersDto;

@Repository("usersDao")
public class UsersDao {
	@Autowired
	private SqlSession sqlSession;
	
	//비즈니스 회원가입
	public void joinBusiness(UsersDto dto) throws Exception{
		sqlSession.insert("Users.joinBusiness",dto);
	}
	
	//이메일 중복체크
	public int emailChk(String uemail) throws Exception{
		int result = sqlSession.selectOne("Users.emailChk",uemail);
		return result;
	}
	
	
	
	
	
	
	/* 아래부터 혜원 채팅 관련 코드 */
	
	//cno에 해당되는 유저 리스트
	public List<UsersDto> ChatUsersList(UsersDto dto) throws Exception{
		return sqlSession.selectList("Users.ChatUsersList", dto);
	}

}