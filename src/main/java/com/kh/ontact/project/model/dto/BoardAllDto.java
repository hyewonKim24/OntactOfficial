package com.kh.ontact.project.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.kh.ontact.project.files.model.dto.FilesDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class BoardAllDto {
	private String bno;
	private String pno;
	private String uno;
	private String bname;
	private int bopen;
	private int btype;
	private int bfirst;
	private Date bdate;
}
