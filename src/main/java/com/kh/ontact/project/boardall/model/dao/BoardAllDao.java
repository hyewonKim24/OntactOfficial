package com.kh.ontact.project.boardall.model.dao;

import java.util.List;

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
	
	public int deleteBoardall(int bno) throws Exception{
		return sqlSession.delete("BoardAll.deleteBoardall", bno);
	}
	
	public List<BoardAllDto> ListTaskBoardAll(String pno) throws Exception{
		return sqlSession.selectList("BoardAll.ListTaskBoardAll"
				+ "", pno);
	}
	
//	혜림 BoardAll 스케줄 추가 
	public int insertBoardAllSchedule(BoardAllDto dto) throws Exception {
		return sqlSession.insert("BoardAll.insertBoardAllSchedule",dto);
	}
	
	
}
