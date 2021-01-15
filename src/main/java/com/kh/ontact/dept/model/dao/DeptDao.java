package com.kh.ontact.dept.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.dept.model.dto.DeptDto;
import com.kh.ontact.overwork.model.dto.OverworkDto;

@Repository("deptDao")
public class DeptDao {
	@Autowired
	private SqlSession sqlSession;
	
	//윤진 : 부서 목록 뿌리기
	public List<DeptDto> selectListDept(String cno){
		return sqlSession.selectList("Dept.selectListDept", cno);
	}
	//혜림
	public int listCount() {
		return sqlSession.selectOne("Dept.listCount");
	}
	public List<DeptDto> selectDept() {
		return sqlSession.selectList("Dept.selectDept");
	}
	public DeptDto selectDtOne(String dno) { 
		return sqlSession.selectOne("Dept.selectDtOne", dno);
	}
	public List<DeptDto> searchDept(String keyword) { // 게시글 검색 조회 
		return sqlSession.selectList("Dept.searchDept", keyword);
	}
	public int insertDept(DeptDto d) { // 글 입력 
		return sqlSession.insert("Dept.insertDept", d);
	}
	public int deleteDept(String dno) { // 글 삭제 
		return sqlSession.delete("Dept.deleteDept", dno);
	}
	//은실
	public String dnameChk(String dno) throws Exception {
		return sqlSession.selectOne("Dept.dnameChk", dno);
	}
	
	
}