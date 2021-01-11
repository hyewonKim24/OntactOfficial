package com.kh.ontact.dept.model.dto;

import org.springframework.stereotype.Component;

import com.kh.ontact.users.model.dto.UsersDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class DeptDto {
	private String dno;
	private String cno;
	private String dname;
	
	private UsersDto usersdto;
}
