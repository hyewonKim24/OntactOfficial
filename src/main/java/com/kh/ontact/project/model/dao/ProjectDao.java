package com.kh.ontact.project.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.model.dto.ProjectDto;

@Repository("pjDao")
public class ProjectDao {
//	updateTeamProject

	@Autowired
	private SqlSession sqlSession;

	// 프로젝트 전체 목록
	public List<ProjectDto> selectListProject(String uno) {
		return sqlSession.selectList("Project.selectListProject", uno);
	}
	
	// 프로젝트 전체목록 : 회사명
	public ProjectDto selectOneCompany(String uno){
		return sqlSession.selectOne("Project.selectOneCompany", uno);
	}
	
	// 프로젝트 전체목록 : 회사명
	public ProjectDto selectOneTeam(String uno){
		return sqlSession.selectOne("Project.selectOneTeam", uno);
	}
	
	// 프로젝트 생성
	public int insertProject(ProjectDto pj) {
		return sqlSession.insert("Project.insertProject", pj);
	}
}
