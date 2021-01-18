package com.kh.ontact.project.schedule.model.dto;


import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//BNO NUMBER(10) NOT NULL,
//SSTART DATE NOT NULL,
//SEND DATE NOT NULL,
//SPLACE VARCHAR2(50),
//SMEMO VARCHAR2(50),
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ScheduleDto {
	private int bno;
	private String sstart;
	private String send;
	private String splace;
	private String smemo;
	private String attendee;
	private String attendees;

	private String pno;
	private String pname;
	private String bname;
	private int btype;
	private int bopen;
	private Date bdate;
	private int bfirst;
	
	private String uno;
	private String uname;

	private Date tstart;
	private Date tend;
	private String taskmanager;
}
