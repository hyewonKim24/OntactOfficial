package com.kh.ontact.approval.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
//APNO        NOT NULL VARCHAR2(20)   
//DNO         NOT NULL VARCHAR2(20)   
//UNO         NOT NULL VARCHAR2(20)   
//APTITLE     NOT NULL VARCHAR2(50)   
//APDATE               DATE           
//APCONTENT            VARCHAR2(1800) 
//APPERSON             VARCHAR2(20)   
//APSTATE     NOT NULL NUMBER(1)      
//APREJECTION          VARCHAR2(50)   
//APPLACE              VARCHAR2(50)   
//APATTEND             VARCHAR2(50)   
//APDEC                VARCHAR2(100)  
//APETC                VARCHAR2(100)  
//APFORMAT             VARCHAR2(50)   
//APDRAFTER            VARCHAR2(50)   
//APPTITLE    NOT NULL VARCHAR2(50)   
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Component

public class ApprovalDto {
	private String apno;
	private String dno;
	private String uno;
	private String aptitle;
	private Date apdate;
	private String apcontent;
	private String apperson;
	private int apstate;
	private String aprejection;
	private String applace;
	private String apattend;
	private String apdec;
	private String apetc; 
	private String apformat;
	private String apdrafter;
	private String apptitle;
	
}
