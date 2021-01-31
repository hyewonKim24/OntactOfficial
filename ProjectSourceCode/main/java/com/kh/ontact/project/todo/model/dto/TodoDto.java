package com.kh.ontact.project.todo.model.dto;

import org.springframework.stereotype.Component;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class TodoDto {
	private int bno;
	private String tdcontent;
	private String tddate;
	private int tdcheck;
	private String tdresponsibility;
	private int tdno;
}
