package com.kh.ontact.users.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.users.model.dto.CustomUserDetails;

@Repository("userAuthDAO")
public class UserAuthDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CustomUserDetails getUserById(String username) {
		return sqlSession.selectOne("Users.selectUserById", username);
	}
}
