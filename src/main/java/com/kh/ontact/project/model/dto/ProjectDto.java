package com.kh.ontact.project.model.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.kh.ontact.dept.model.dto.DeptDto;
import com.kh.ontact.projectDept.model.dto.ProjectDeptDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ProjectDto implements Serializable{
	private static final long serialVersionUID=20001L;
	private String pno;
	private String pname;
	private String pdesc;
	private Date pdate;
	private int popen;
	
	// 프로젝트 전체 목록 : 인원수, 부서보관함목록
	private String pjmembercnt;
	private String pjteam;
	
	// 프로젝트 전체 목록 : 회사명
	private String cno;
	private String cname;
	private int ucnt;
	
	// 프로젝트 전체 목록 : 부서
	private String dno;
	private String dname;
}