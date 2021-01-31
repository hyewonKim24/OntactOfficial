package com.kh.ontact.project.task.model.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.reply.model.dto.ReplyDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
@NoArgsConstructor
@AllArgsConstructor
public class TaskDto {
	private int bno;
	private String tstate;
	private Date tstart;
	private Date tend;
	private String trate;
	private String tpriority;
	private String taskmanager;
	private String tmemo;
	private String uname;
	private BoardAllDto boardalldto;
	private int count;
	private String runame;
	private List<ReplyDto> replydto;
	
	//rownum
	private String rownum;
	
	
	// Proejct Detail 전체 리스트
	public TaskDto(int bno, String tstate, Date tstart, Date tend, String trate, String tpriority, String taskmanager,
			String tmemo) {
		super();
		this.bno = bno;
		this.tstate = tstate;
		this.tstart = tstart;
		this.tend = tend;
		this.trate = trate;
		this.tpriority = tpriority;
		this.taskmanager = taskmanager;
		this.tmemo = tmemo;
	}
	
}
