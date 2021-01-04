package com.kh.ontact.project.model.service;

import java.util.List;

import com.kh.ontact.project.model.dto.ProjectDto;
import com.kh.ontact.projectDept.model.dto.ProjectDeptDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;

public interface ProjectService {
	//프로젝트 전체 목록 : 프로젝트명, 공개여부
	public List<ProjectDto> selectListProject() throws Exception;
	
	//프로젝트 전체 목록 : 참여수 
	public List<ProjectDto> selectListProjectMcnt() throws Exception;	
	
	//프로젝트 생성
	public void insertProject(ProjectDto pj, ProjectMemberDto pjm, ProjectDeptDto pjd) throws Exception;
}
