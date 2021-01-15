package com.kh.ontact.alert.model.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.kh.ontact.chat.model.dto.ChatDto;

import lombok.Data;

/*RNO             VARCHAR2(20) 
UNO    NOT NULL VARCHAR2(20) 
PNO             VARCHAR2(20) 
BNO             NUMBER(10)   
ACOUNT NOT NULL NUMBER(1)    
ADATE           DATE   */

@Data
@Component
public class AlertDto {
	private String rno;
	private String uno;
	private String pno;
	private int bno;
	private int acount;
	private Date adate; 

}
