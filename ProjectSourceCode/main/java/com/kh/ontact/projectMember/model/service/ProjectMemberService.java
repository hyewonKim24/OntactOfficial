package com.kh.ontact.projectMember.model.service;

import java.util.List;

import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;

public interface ProjectMemberService {
	
	List<String> AlertProList(ProjectMemberDto dto);
	int projectMeberinvite(List<ProjectMemberDto> dto);
	
}
