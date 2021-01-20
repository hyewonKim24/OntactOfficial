package com.kh.ontact.project.boardall.model.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.project.task.model.dto.TaskDto;
import com.kh.ontact.project.todo.model.dto.TodoViewDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class BoardAllViewDto {
	private int bno;
	private String pno;
	private String uno;
	private String bname;
	private int bopen;
	private int btype;
	private Date bdate;
	private int bfirst;
	
	private String uname;
	private String ufilepath;
		
	private List<CommonboardDto> CommonboardDto ;
	private List<TaskDto> TaskDto;
	private List<ScheduleDto> ScheduleDto;
	private List<TodoViewDto> TodoViewDto;
}
