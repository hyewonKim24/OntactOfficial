package com.kh.ontact.project.task.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

/*BNO         NOT NULL VARCHAR2(20)   
TSTATE      NOT NULL VARCHAR2(50)   
TSTART      NOT NULL DATE           
TEND        NOT NULL DATE           
TRATE       NOT NULL VARCHAR2(50)   
TPRIORITY   NOT NULL VARCHAR2(20)   
TMEMO                VARCHAR2(1800) 
TASKMANAGER          VARCHAR2(20)   */

@Data
@Component
public class TaskDto {
	private String tstate;
	private Date tstart;
	private Date tend;
	private String trate;
	private String tpriority;
	private String taskmanager;
	
}
