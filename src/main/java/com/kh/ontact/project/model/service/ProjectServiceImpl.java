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
	public void insertProject(ProjectDto pj, String uno, String dno) throws Exception {
		pjDao.insertProject(pj);
		pjmDao.insertProjectMember(uno);
		if(dno!=null) {
			String [] array = dno.split(",");
			for(int i=0; i<array.length; i++ ) {
				dno = array[i];
				pjdDao.insertProjectDept(dno);	
			}
		} else {
			pjdDao.insertProjectDept(dno);
		}
	}
	
	// 미보관 프로젝트
	@Override
	public List<ProjectDto> selectListPjUns(String uno) throws Exception{
		return pjDao.selectListPjUns(uno);
	}
	
	// 부서별 보관함 프로젝트 목록
	@Override
	public List<ProjectDto> selectListPjTeam(HashMap<String, String> paramMap)throws Exception{
		return pjDao.selectListPjTeam(paramMap);
	}
	
}
