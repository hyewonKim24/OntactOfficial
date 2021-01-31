package com.kh.ontact.dept.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.dept.model.dto.DeptDto;
import com.kh.ontact.overwork.model.dto.OverworkDto;
import com.kh.ontact.users.model.dto.UsersDto;

@Repository("deptDao")
public class DeptDao {
	@Autowired
	private SqlSession sqlSession;
	
	//윤진 : 부서 목록 뿌리기
	public List<DeptDto> selectListDept(String cno){
		return sqlSession.selectList("Dept.selectListDept", cno);
	}
	
	//혜림
	public int listCount(String cno) {
		return sqlSession.selectOne("Dept.listCount", cno);
	}
	public List<DeptDto> selectDept(String cno) {
		return sqlSession.selectList("Dept.selectDept", cno);
	}
	public DeptDto selectDtOne(String dno) { 
		return sqlSession.selectOne("Dept.selectDtOne", dno);
	}
	public int searchlistCount() {
		return sqlSession.selectOne("Dept.searchlistCount");
	}
	public List<DeptDto> searchDept(String keyword) { // 게시글 검색 조회 
		return sqlSession.selectList("Dept.searchDept", keyword);
	}
	public int insertDept(DeptDto d) { // 글 입력 
		return sqlSession.insert("Dept.insertDept", d);
	}
	public int deleteDept(HashMap<String, String> paramMap2) { 
		System.out.println("삭제 다오까지옴");
		System.out.println(paramMap2.get("dno"));
		System.out.println(paramMap2.get("cno"));
		
		
		return sqlSession.delete("Dept.deleteDept", paramMap2);
	}
	public int updateDept(UsersDto dto) { 
		System.out.println("업데이트 다오까지옴");
		return sqlSession.delete("Dept.updateDept", dto);
	}
	
	//은실
	public String dnameChk(String dno) throws Exception {
		return sqlSession.selectOne("Dept.dnameChk", dno);
	}
	
	//혜원
	public String selectDeptPno(DeptDto dto) throws Exception {
		return sqlSession.selectOne("Dept.selectDeptPno", dto);
	}
	
	
}