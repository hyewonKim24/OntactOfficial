package com.kh.ontact.chatmember.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

//------------- -------- ------------ 
//CHATNO        NOT NULL VARCHAR2(20) 
//UNO           NOT NULL VARCHAR2(20) 
//CREATCHAT     NOT NULL NUMBER(2)    
//CHATSTARTDATE NOT NULL DATE         
//CHATENDDATE            DATE         

@Data
@Component
public class ChatMemberDto {
	private String chatno;
	private String uno;
	private int creatchat;
	private Date chatstartdate;
	private Date chatenddate;

}
