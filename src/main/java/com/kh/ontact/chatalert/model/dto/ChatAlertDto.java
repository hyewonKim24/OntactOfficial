package com.kh.ontact.chatalert.model.dto;
//--------- -------- ------------ 
//CHATNO    NOT NULL VARCHAR2(20) 
//CCNO      NOT NULL NUMBER(20)   
//UNO       NOT NULL VARCHAR2(20) 
//CHATCOUNT NOT NULL NUMBER(20)   

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ChatAlertDto {
	private String chatno;
	private String uno;
	private String chatcount;
}
