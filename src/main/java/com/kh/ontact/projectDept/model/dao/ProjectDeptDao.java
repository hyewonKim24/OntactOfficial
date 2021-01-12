package com.kh.ontact.projectDept.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.projectDept.model.dto.ProjectDeptDto;

@Repository("pjDeptDao")
public class ProjectDeptDao {
	@Autowired
	private SqlSession sqlSession;
	
	//프로젝트 생성 : 부서보관함 지정
	public int insertProjectDept(String dno) {
		return sqlSession.insert("Project.insertProjectDept", dno);
	}
}
