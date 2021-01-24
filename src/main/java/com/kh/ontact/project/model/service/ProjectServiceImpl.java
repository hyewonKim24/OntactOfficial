package com.kh.ontact.project.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.model.dao.ProjectDao;
import com.kh.ontact.project.model.dto.ProjectDto;
import com.kh.ontact.projectDept.model.dao.ProjectDeptDao;
import com.kh.ontact.projectDept.model.dto.ProjectDeptDto;
import com.kh.ontact.projectMember.model.dao.ProjectMemberDao;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;

@Service("pjService")
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectDao pjDao;
	@Autowired
	private ProjectMemberDao pjmDao;
	@Autowired
	private ProjectDeptDao pjdDao;

	// 프로젝트 전체 목록
	@Override
	public List<ProjectDto> selectListProject(HashMap<String, String> paramMap) throws Exception {
		return pjDao.selectListProject(paramMap);
	}

	//프로젝트 목록 : 회사
	@Override
	public ProjectDto selectOneCompany(String uno) throws Exception {
		return pjDao.selectOneCompany(uno);
	}
	
	//프로젝트 목록 : 부서
	@Override
	public ProjectDto selectOneTeam(HashMap<String, String> paramMap) throws Exception {
		return pjDao.selectOneTeam(paramMap);
	}

	// 프로젝트 생성
	@Override
	public void insertProject(ProjectDto pj, ProjectMemberDto pjm, List<ProjectDeptDto> pjdlist) throws Exception {
		pjDao.insertProject(pj);
		pjmDao.insertProjectMember(pjm);
		int rs=0;
		for(int i=0; i<pjdlist.size(); i++) {
			rs += pjdDao.insertProjectDept(pjdlist.get(i));
		}
	}
	
	// 미보관 프로젝트
	@Override
	public List<ProjectDto> selectListPjUns(HashMap<String, String> paramMap) throws Exception{
		return pjDao.selectListPjUns(paramMap);
	}
	
	// 읽지않음 프로젝트
	@Override
	public List<ProjectDto> selectListPjUnread(HashMap<String, String> paramMap) throws Exception{
		return pjDao.selectListPjUnread(paramMap);
	}
	
	// 부서별 보관함 프로젝트 목록
	@Override
	public List<ProjectDto> selectListPjTeam(HashMap<String, String> paramMap)throws Exception{
		return pjDao.selectListPjTeam(paramMap);
	}

	@Override
	public String SelectCompanyPno(String cno) throws Exception {
		return pjDao.SelectCompanyPno(cno);
	}

	@Override
	public ProjectDto SelectProName(String pno) throws Exception {
		return pjDao.SelectProName(pno);
	}

	@Override
	public int deleteProject(String pno) throws Exception {
		return pjDao.deleteProject(pno);
	}
	
}
