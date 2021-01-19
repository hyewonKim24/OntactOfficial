package com.kh.ontact.project.todo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllViewDto;
import com.kh.ontact.project.todo.model.dao.TodoDao;
import com.kh.ontact.project.todo.model.dto.TodoDto;
import com.kh.ontact.project.todo.model.dto.TodoViewDto;
import com.kh.ontact.users.model.dto.UsersDto;

@Service("todoService")
public class TodoServiceImpl implements TodoService{
	@Autowired
	private TodoDao todoDao;
	@Autowired
	private BoardAllDao boardallDao;

	@Override
	public List<BoardAllViewDto> getBoardAllList(String uno) throws Exception  {
		return todoDao.getBoardAllList(uno);
	}

	@Override
	public List<TodoViewDto> getTodoList() throws Exception {
		return todoDao.getTodoList();
	}
	
	//todo insert
	@Override
	public void insertTodo(BoardAllDto ball, List<TodoDto> tlist) throws Exception {
			boardallDao.insertBoardAllTodo(ball);
			int rs = 0;
			for(int i=0; i<tlist.size(); i++) {
				rs += todoDao.insertTodo(tlist.get(i));
			}
			System.out.println(rs);
	}
	//todo update
	@Override
	public int updateTodoCheckFalse(int tdno) throws Exception {
		return todoDao.updateTodoCheckFalse(tdno);
	}

	@Override
	public int updateTodoCheckTrue(int tdno) throws Exception {
		return todoDao.updateTodoCheckTrue(tdno);
	}

	@Override
	public int updateTodoDate(TodoDto tddto) throws Exception {
		return todoDao.updateTodoDate(tddto);
	}

	@Override
	public int updateTodoUno(TodoDto tddto) throws Exception {
		return todoDao.updateTodoUno(tddto);
	}
}
