package com.kh.ontact.project.todo.model.service;

import java.util.List;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllViewDto;
import com.kh.ontact.project.todo.model.dto.TodoDto;
import com.kh.ontact.project.todo.model.dto.TodoViewDto;
import com.kh.ontact.users.model.dto.UsersDto;

public interface TodoService {
	public List<BoardAllViewDto> getBoardAllList(String uno) throws Exception ;
	
	public List<TodoViewDto> getTodoList() throws Exception ;
	
	public void insertTodo(BoardAllDto ball, List<TodoDto> td) throws Exception ;
	
	public int updateTodoCheckFalse(int tdno) throws Exception;
	
	public int updateTodoCheckTrue(int tdno) throws Exception;
	
	public int updateTodoDate(TodoDto tddto) throws Exception;

	public int updateTodoUno(TodoDto tddto) throws Exception;

}
