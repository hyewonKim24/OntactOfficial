package com.kh.ontact.chat.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;
        
//-------- -------- ------------ 
//CHATNO   NOT NULL VARCHAR2(20) 
//PNO               VARCHAR2(20) 
//CHATNAME          VARCHAR2(50) 
@Data
@Component
public class ChatDto {
	private String chatno;
	private String pno;
	private String chatname;
	
	

}
