package com.kh.ontact.projectMember.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;

@Repository("pjMemberDao")
public class ProjectMemberDao {

	@Autowired
	private SqlSession sqlSession;

	// 프로젝트 생성 : 멤버 영입
	public int insertProjectMember(ProjectMemberDto pjm) {
		return sqlSession.insert("ProjectMember.insertProjectMember", pjm);
	}
}
