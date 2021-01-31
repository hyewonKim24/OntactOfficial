package com.kh.ontact.projectMember.model.dao;

import java.util.List;
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
		return sqlSession.insert("Project.insertProjectMember", pjm);
	}
	// 프로젝트 리스트 ( 내 uno 제외 )
	public List<String> AlertProList(ProjectMemberDto dto) {
		return sqlSession.selectList("ProjectMember.AlertProList", dto);
	}
	// 프로젝트 멤버 초대 
	public int projectMeberinvite(ProjectMemberDto dto) {
		return sqlSession.insert("ProjectMember.projectMeberinvite", dto);
	}
}
