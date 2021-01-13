package com.kh.ontact.project.boardall.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;

@Repository("baDao")
public class BoardAllDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertBoardAllTask(BoardAllDto dto) throws Exception {
		return sqlSession.insert("BoardAll.insertBoardAllTask",dto);
	}
	
	public int deleteBoardall(String bno) throws Exception{
		return sqlSession.delete("BoardAll.deleteBoardall", bno);
	}
	
	
}
