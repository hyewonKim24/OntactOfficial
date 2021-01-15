package com.kh.ontact.alert.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;

@Repository("alertDao")
public class AlertDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int alertInsert(BoardAllDto dto) throws Exception {
		return sqlSession.insert("Alert.alertInsert",dto);
	}

}
