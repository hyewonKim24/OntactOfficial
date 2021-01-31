package com.kh.ontact.alert.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.alert.model.dto.AlertDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.users.model.dto.UsersDto;

@Repository("alertDao")
public class AlertDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int alertInsert(AlertDto dto) throws Exception {
		return sqlSession.insert("Alert.alertInsert",dto);
	}
	
	public int deleteAll(int bno) throws Exception {
		return sqlSession.delete("Alert.deleteAll",bno);
	}
	public int alertCount(String uno) throws Exception {
		return sqlSession.selectOne("Alert.alertCount",uno);
	}
	public List<AlertDto> alertNotList(String uno) throws Exception {
		return sqlSession.selectList("Alert.alertNotList",uno);
	}
	public List<AlertDto> alertAllList(String uno) throws Exception {
		return sqlSession.selectList("Alert.alertAllList",uno);
	}
	public int alertAllRead(String uno) throws Exception {
		return sqlSession.update("Alert.alertAllRead",uno);
	}
	public int alertProRead(AlertDto dto) throws Exception {
		return sqlSession.update("Alert.alertProRead",dto);
	}
	public int alertBoardRead(AlertDto dto) throws Exception {
		return sqlSession.update("Alert.alertBoardRead",dto);
	}
	

}
