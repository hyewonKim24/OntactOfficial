package com.kh.ontact.project.boardall.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

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
