package com.kh.ontact.project.commonboard.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class CommonboardDto {
	private String bno;
	private String bdesc;
	private String[] files;
}
