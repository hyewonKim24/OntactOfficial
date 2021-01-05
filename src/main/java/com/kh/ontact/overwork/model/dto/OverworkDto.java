package com.kh.ontact.overwork.model.dto;
//UNO VARCHAR2(20) NOT NULL,
//OWDATE DATE NOT NULL,
//OWTIME NUMBER(2) NOT NULL,
//OWTITLE VARCHAR2(200) NOT NULL,
//OWREASON VARCHAR2(600) NOT NULL,
//OWAPPROVAL NUMBER(1),

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.kh.ontact.dayoff.model.dto.DayoffDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class OverworkDto {
	private String owno;
	private String uno;
	private String dname;
	private String uname;
	private Date owdate;
	private int owtime;
	private String owtitle;
	private String owreason;
	private int owapproval;
	private Date owapplydate;
	
}
