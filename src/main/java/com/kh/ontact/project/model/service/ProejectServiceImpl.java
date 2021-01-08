package com.kh.ontact.project.model.service;

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
public class ProejectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectDao pjDao;
	@Autowired
	private ProjectMemberDao pjmDao;
	@Autowired
	private ProjectDeptDao pjdDao;

	// 프로젝트 전체 목록
	@Override
	public List<ProjectDto> selectListProject(String uno) throws Exception {
		return pjDao.selectListProject(uno);
	}

	//프로젝트 목록 : 회사
	@Override
	public ProjectDto selectOneCompany(String uno) throws Exception {
		return pjDao.selectOneCompany(uno);
	}
	
	//프로젝트 목록 : 부서
	@Override
	public ProjectDto selectOneTeam(String uno) throws Exception {
		return pjDao.selectOneTeam(uno);
	}

	// 프로젝트 생성
	@Override
	public void insertProject(ProjectDto pj, ProjectMemberDto pjm, ProjectDeptDto pjd) throws Exception {
		pjDao.insertProject(pj);
		pjmDao.insertProjectMember(pjm);
		pjdDao.insertProjectDept(pjd);
	}

	
}
