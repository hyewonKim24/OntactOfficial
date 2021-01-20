package com.kh.ontact.projectMember.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ProjectMemberDto {
	private String pno;
	private String uno;
	private int padmin;
	private String uname;
	private String pname;
	private String ufilepath;
	
	//프로젝트 목록
	public ProjectMemberDto(String pno, String uno) {
		super();
		this.pno = pno;
		this.uno = uno;
	}
	
}
