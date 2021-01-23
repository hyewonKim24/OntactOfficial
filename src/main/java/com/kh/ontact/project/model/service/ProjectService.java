package com.kh.ontact.project.model.service;

import java.util.HashMap;
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
	public ProjectDto selectOneTeam(HashMap<String, String> paramMap) throws Exception;
	
	//프로젝트 생성
	public void insertProject(ProjectDto pj, String uno, String dno) throws Exception;
	
	//미보관 프로젝트
	public List<ProjectDto> selectListPjUns(String uno) throws Exception;

	// 부서별 보관함 프로젝트 목록
	public List<ProjectDto> selectListPjTeam(HashMap<String, String> paramMap) throws Exception;

}
