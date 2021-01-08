package com.kh.ontact.dept.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.dept.model.dto.DeptDto;

@Repository("DeptDao")
public class DeptDao {

	@Autowired
	private SqlSession sqlSession;
	
	//부서 목록 뿌리기
	public List<DeptDto> selectListDeptDname(){
		return sqlSession.selectList("Dept.selectListDeptDname");
	}
}
