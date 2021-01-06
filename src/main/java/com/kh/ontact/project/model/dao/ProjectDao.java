
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
	public List<ProjectDto> selectListProject() {
		return sqlSession.selectList("Project.selectListProject");
	}

	// 프로젝트 생성
	public int insertProject(ProjectDto pj) {
		return sqlSession.insert("Project.insertProject", pj);
	}
}
