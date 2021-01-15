package com.kh.ontact.commute.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.commute.model.dto.CommuteDto;

@Repository("commuteDao")
public class CommuteDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int allListCount() {
		return sqlSession.selectOne("CommuteMapper.allListCount");
	}
	public List<CommuteDto> selectDailyCommute(int startPage, int limit, String uno) { // 특정 페이지 단위의 게시글 조
		System.out.println("다오까지 왔는데,,");
		int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
		RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowboun
		return sqlSession.selectList("CommuteMapper.selectDailyCommute",uno,row);
	}
	public int listCount() {
		return sqlSession.selectOne("CommuteMapper.listCount");
	}
	public List<CommuteDto> searchDailyCommute(HashMap<String, String> paramMap) { // 특정 페이지 단위의 게시글 조
		return sqlSession.selectList("CommuteMapper.searchDailyCommute", paramMap);
	}
	
	public int insertEnter(CommuteDto c) { // 글 입력
		System.out.println("commute 다오 insert 진입");
		return sqlSession.insert("CommuteMapper.insertEnter", c);
	}
	public int updateLeave(CommuteDto c) { // 글 수정 
		System.out.println("commute 다오 insert 진입");
		return sqlSession.update("CommuteMapper.updateLeave", c);
	}
	
//	월 근무 내역 
	//기본
	public int mAllCount() {
		return sqlSession.selectOne("CommuteMapper.mAllCount");
	}
	public List<CommuteDto> selectMonthCommute(int startPage, int limit, String uno) {
		int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
		RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowboun
		return sqlSession.selectList("CommuteMapper.selectMonthCommute",uno,row);
	}
	//날짜지정
	public int msearchCount() {
		return sqlSession.selectOne("CommuteMapper.msearchCount");
	}
	public List<CommuteDto> searchMonthCommute(HashMap<String, String> paramMap) { // 특정 페이지 단위의 게시글 조
		return sqlSession.selectList("CommuteMapper.searchMonthCommute", paramMap);
	}
	
	public List<CommuteDto> testCommute(String uno) {
		return sqlSession.selectList("CommuteMapper.testCommute");
	}
	
	
	
}
