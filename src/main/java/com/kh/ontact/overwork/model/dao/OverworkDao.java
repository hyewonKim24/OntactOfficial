package com.kh.ontact.overwork.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.overwork.model.dto.OverworkDto;

@Repository("overworkDao")
public class OverworkDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int listCount() {
		return sqlSession.selectOne("OverworkMapper.listCount");
	}
	public List<OverworkDto> selectOverwork(int startPage, int limit, String uno) {
		System.out.println("overwork 다오까지 왔는데,,");
		int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
		RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowboun
		return sqlSession.selectList("OverworkMapper.selectOverwork", uno,row);
	}
	public List<OverworkDto> searchOverwork(HashMap<String, String> paramMap) { // 게시글 검색 조회 
		return sqlSession.selectList("OverworkMapper.searchOverwork", paramMap);
	}
	public OverworkDto selectOwOne(String owno) { 
		return sqlSession.selectOne("OverworkMapper.selectOwOne", owno);
	}
	public int insetOverwork(OverworkDto o) { // 글 입력 
		return sqlSession.insert("OverworkMapper.insetOverwork", o);
	}
	
	public int updateOverworkApp(OverworkDto o, String uno) { // 글 수정 
		return sqlSession.update("OverworkMapper.updateOverworkApp", o);
	}
}
