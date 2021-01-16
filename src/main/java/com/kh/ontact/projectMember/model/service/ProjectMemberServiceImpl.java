package com.kh.ontact.projectMember.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.projectMember.model.dao.ProjectMemberDao;

@Service("pmService")
public class ProjectMemberServiceImpl implements ProjectMemberService{
	@Autowired
	private ProjectMemberDao pjMemberDao;
	

}
