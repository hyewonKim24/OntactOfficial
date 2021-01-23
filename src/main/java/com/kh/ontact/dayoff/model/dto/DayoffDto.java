package com.kh.ontact.dayoff.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//UNO VARCHAR2(20) NOT NULL,
//OFFDAYS NUMBER(2) NOT NULL,
//OFFSTART DATE NOT NULL,
//OFFEND DATE NOT NULL,
//OFFTIME DATE NOT NULL,
//OFFAPPROVAL NUMBER(1) NOT NULL,

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class DayoffDto {
	private String dfno;
	private String cno;
	private String uno;
	private String dno;
	private String dname;
	private String uname;
	private int offdays;
	private Date offstart;
	private Date offend;
	private Date offtime;
	private String offreason;
	private int offapproval;
//	private List<UserDto> userdtolist;
//	private UserDto userdto;
	
}
