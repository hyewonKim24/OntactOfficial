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
	
	public int allListCount(String uno) {
		return sqlSession.selectOne("CommuteMapper.allListCount", uno);
	}
	public List<CommuteDto> selectDailyCommute(int startPage, int limit, String uno) { // 특정 페이지 단위의 게시글 조
		int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
		RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowboun
		return sqlSession.selectList("CommuteMapper.selectDailyCommute",uno,row);
	}
	
	public int listCount(HashMap<String, String> paramMap) {
		System.out.println("다오" + paramMap);
		return sqlSession.selectOne("CommuteMapper.listCount", paramMap);
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
	public int mAllCount(String uno) {
		return sqlSession.selectOne("CommuteMapper.mAllCount", uno);
	}
	public List<CommuteDto> selectMonthCommute(int startPage, int limit, String uno) {
		int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
		RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowboun
		return sqlSession.selectList("CommuteMapper.selectMonthCommute",uno,row);
	}
	
	//날짜지정
	public int msearchCount(HashMap<String, String> paramMap) {
		return sqlSession.selectOne("CommuteMapper.msearchCount", paramMap);
	}
	public List<CommuteDto> searchMonthCommute(HashMap<String, String> paramMap) { // 특정 페이지 단위의 게시글 조
		return sqlSession.selectList("CommuteMapper.searchMonthCommute", paramMap);
	}
	
	public List<CommuteDto> testCommute(String uno) {
		return sqlSession.selectList("CommuteMapper.testCommute", uno);
	}
	
	
	
}
