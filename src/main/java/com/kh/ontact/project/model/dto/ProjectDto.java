package com.kh.ontact.project.model.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

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
	private String padmin;
	private Date pdate;
	private int popen;
	
	private List<ProjectMemberDto> ProjectMemberDto;

	//프로젝트 전체 목록
	public ProjectDto(String pno, String pname, int popen) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.popen = popen;
	}
	
}