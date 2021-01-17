package com.kh.ontact.project.reply.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.kh.ontact.chat.model.dto.ChatDto;

import lombok.Data;

/*
----- -------- -------------- 
RNO   NOT NULL VARCHAR2(20)   
UNO   NOT NULL VARCHAR2(20)   
BNO   NOT NULL NUMBER(10)     
PNO   NOT NULL VARCHAR2(20)   
RDATE NOT NULL DATE           
RDESC NOT NULL VARCHAR2(1800) */
@Data
@Component
public class ReplyDto {
	private String rno;
	private String uno;
	private int bno;
	private String pno;
	private Date rdate;
	private String rdesc;
	private String uname;

}
