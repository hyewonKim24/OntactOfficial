package com.kh.ontact.project.model.service;

import java.util.List;

import com.kh.ontact.project.model.dto.ProjectDto;
import com.kh.ontact.projectDept.model.dto.ProjectDeptDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;

public interface ProjectService {
	//프로젝트 전체 목록 : 프로젝트명, 공개여부
	public List<ProjectDto> selectListProject(String uno) throws Exception;

	//프로젝트 목록 : 회사
	public ProjectDto selectOneCompany(String uno) throws Exception;
	
	//프로젝트 목록 : 부서
	public ProjectDto selectOneTeam(String uno) throws Exception;
	
	//프로젝트 생성
	public void insertProject(ProjectDto pj, ProjectMemberDto pjm, ProjectDeptDto pjd) throws Exception;

}
