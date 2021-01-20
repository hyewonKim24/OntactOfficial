package com.kh.ontact.project.boardall.model.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.kh.ontact.project.reply.model.dto.ReplyDto;
import com.kh.ontact.project.task.model.dto.TaskDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*------ -------- ------------ 
BNO    NOT NULL VARCHAR2(20) 
PNO    NOT NULL VARCHAR2(20) 
UNO    NOT NULL VARCHAR2(20) 
BNAME  NOT NULL VARCHAR2(20) 
BOPEN  NOT NULL NUMBER(1)    
BTYPE  NOT NULL NUMBER(1)    
BFIRST          NUMBER(1)    
BDATE           DATE        */

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class BoardAllDto {
	private int bno;
	private String pno;
	private String uno;
	private String bname;
	private int bopen;
	private int btype;
	private int bfirst;
	private Date bdate;
	private String uname;
	private TaskDto taskdto;
	private int count;
	private String runame;
	private List<ReplyDto> replydto;
	
	
}
