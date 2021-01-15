package com.kh.ontact.project.files.model.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class FilesDto {
	private String fname;
	private String pno;
	private String bno;
	private String uno;
	private Date fdate;
	private String fsize;
	private String fpath;
	private List<FilesDto> filelist;
}
