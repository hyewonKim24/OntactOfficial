package com.kh.ontact.chatcontent.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

//------------ -------- -------------- 
//CCNO         NOT NULL NUMBER(20)     
//CHATNO       NOT NULL VARCHAR2(20)   
//UNO          NOT NULL VARCHAR2(20)   
//CHATDATE     NOT NULL DATE           
//CONTENT               VARCHAR2(1800) 
//CHATFIX               NUMBER(1)      
//CHATIMG               VARCHAR2(50)   
//CHATFILEPATH          VARCHAR2(300)  

@Data
@Component
public class ChatContentDto {
	private int ccno;
	private String chatno;
	private String uno;
	private Date chatdate;
	private String content;
	private int chatfix;
	private String chatimg;
	private String chatfilepath;
	
}
