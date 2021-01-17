package com.kh.ontact.projectMember.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.projectMember.model.dao.ProjectMemberDao;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;

@Service("pmService")
public class ProjectMemberServiceImpl implements ProjectMemberService{
	@Autowired
	private ProjectMemberDao pjMemberDao;

	@Override
	public List<String> AlertProList(ProjectMemberDto dto) {
		return pjMemberDao.AlertProList(dto);
	}
	

}
