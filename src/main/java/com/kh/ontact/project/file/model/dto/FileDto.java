package com.kh.ontact.project.file.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class FileDto {
	private String fno;
	private String pno;
	private String fname;
	private Date fdate;
	private String fsize;
	private String fpath;
}
