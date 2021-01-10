package com.kh.ontact.commute.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


//UNO VARCHAR2(20) NOT NULL,
//CDATE DATE NOT NULL,
//CSTATE VARCHAR2(20) NOT NULL,
//CSTARTTIME DATE NOT NULL,
//CENDTIME DATE NOT NULL,
//CWORKTIME DATE NOT NULL,
//CADDITIONALTIME VARCHAR2(20),
//CAPPROVAL VARCHAR2(20),

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class CommuteDto {
	private String uno;
	private String dname;
	private String uname;
	private Date cdate;
	private String cstate;
	private String cstarttime;
	private String cendtime;
	private String cworktime;
	private String creason;
	private int owtime;
	private double total;
}
