package com.kh.ontact.project.commonboard.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class CommonboardDto {
	private int bno;
	private String bdesc;
	private String[] files;
	
	//임시로 만든것
	private String pno;
	private String bname;
	private String popen;
	private Date bdate;

}
