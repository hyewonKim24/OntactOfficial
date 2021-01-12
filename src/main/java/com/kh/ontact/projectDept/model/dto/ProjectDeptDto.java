package com.kh.ontact.projectDept.model.dto;

import java.util.List;

import org.springframework.stereotype.Component;

import com.kh.ontact.dept.model.dto.DeptDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ProjectDeptDto {
	private String pno;
	private String dno;
	
}
