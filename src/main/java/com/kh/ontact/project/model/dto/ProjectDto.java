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
	
	private List<ProjectMemberDto> ProjectMemberDto;
	private List<ProjectDeptDto> ProjectDeptDto;
	private List<DeptDto> DeptDto;

	//프로젝트 전체 목록
	public ProjectDto(String pno, String pname, int popen) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.popen = popen;
	}
	
}