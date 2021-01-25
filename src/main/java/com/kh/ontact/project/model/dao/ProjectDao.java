package com.kh.ontact.project.model.dao;

import java.util.HashMap;
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
	public List<ProjectDto> selectListProject(HashMap<String, String> paramMap) {
		return sqlSession.selectList("Project.selectListProject", paramMap);
	}
	
	// 프로젝트 전체목록 : 회사명
	public ProjectDto selectOneCompany(String uno){
		return sqlSession.selectOne("Project.selectOneCompany", uno);
	}
	
	// 프로젝트 전체목록 : 부서명
	public ProjectDto selectOneTeam(HashMap<String, String> paramMap){
		return sqlSession.selectOne("Project.selectOneTeam", paramMap);
	}
	
	// 프로젝트 생성
	public int insertProject(ProjectDto pj) {
		return sqlSession.insert("Project.insertProject", pj);
	}
	
	// 미보관 프로젝트
	public List<ProjectDto> selectListPjUns(HashMap<String, String> paramMap){
		return sqlSession.selectList("Project.selectListPjUns", paramMap);
	}
	
	// 읽지않음 프로젝트
	public List<ProjectDto> selectListPjUnread(HashMap<String, String> paramMap){
		return sqlSession.selectList("Project.selectListPjUnread", paramMap);
	}
	// 부서별 보관함 프로젝트 목록
	public List<ProjectDto> selectListPjTeam(HashMap<String, String> paramMap){
		System.out.println("프로젝트부서보관함 dao 진입"+paramMap.get("dname"));
		return sqlSession.selectList("Project.selectListPjTeam", paramMap);
	}
	// 프로젝트 멤버 목록
	public List<ProjectDto> PjUserListDept(String pno)  throws Exception{
		System.out.println("프로젝트 삭제");
		List<ProjectDto> bbbb = sqlSession.selectList("ProjectMember.PjUserListDept", pno);
		System.out.println("프로젝트 삭제" +bbbb);
		return bbbb;
	}
	
	
	
	
	
	
	// 회사 프로젝트 pno 불러오기
	public String SelectCompanyPno(String cno) throws Exception{
		return sqlSession.selectOne("Project.SelectCompanyPno", cno);
	}
	// 프로젝트명, 프로젝트 글 수 불러오기
	public ProjectDto SelectProName(String pno) throws Exception{
		return sqlSession.selectOne("Project.SelectProName", pno);
	}
	// 프로젝트 삭제
	public int deleteProject(String pno) throws Exception{
		return sqlSession.delete("Project.deleteProject", pno);
	}
	
	// 프로젝트 pname 불러오기
	public String selectPname(String pno) throws Exception{
		return sqlSession.selectOne("Project.selectPname", pno);
	}
	

		
}
