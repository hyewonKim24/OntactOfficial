package com.kh.ontact.users.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.users.model.dto.CustomUserDetails;

//시큐리티 dao
@Repository("usersAuthDao")
public class UsersAuthDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CustomUserDetails getUserById(String username) {
		return sqlSession.selectOne("Users.selectUserById", username);
	}
	
	public void updateFailureCount(String username) {
		sqlSession.update("Users.updateFailureCount", username);
	}
	
	public int checkFailureCount(String username) {
		return sqlSession.selectOne("Users.checkFailureCount", username);
	}
	
	public void updateDisabled(String username) {
		sqlSession.update("Users.updateUnenabled", username);
	}

	public void updateFailureCountReset(String username) {
		sqlSession.update("Users.updateFailureCountReset", username);
	}
}
