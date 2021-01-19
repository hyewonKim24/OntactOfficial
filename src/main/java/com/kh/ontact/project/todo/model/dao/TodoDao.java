package com.kh.ontact.project.todo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.boardall.model.dto.BoardAllViewDto;
import com.kh.ontact.project.todo.model.dto.TodoDto;
import com.kh.ontact.project.todo.model.dto.TodoViewDto;

@Repository("todoDao")
public class TodoDao {
	@Autowired
	private SqlSession sqlSession;

	//윤진: Todo 상세글 뿌리기
	public List<BoardAllViewDto> getBoardAllList(String uno) throws Exception{
		return sqlSession.selectList("BoardAllView.getBoardAllList", uno);
	}	
	public List<TodoViewDto> getTodoList() throws Exception{
		return sqlSession.selectList("BoardAllView.getTodoList");
	}
	//윤진: Todo insert
	public int insertTodo(TodoDto tddto) throws Exception {
		return sqlSession.insert("Todo.insertTodo", tddto);
	}
	
	//윤진: Todo update
	public int updateTodoCheckFalse(int tdno) throws Exception{
		System.out.println("todocheckt dao");
		System.out.println(tdno);
		return sqlSession.update("updateTodoCheckFalse",tdno);
	}
	public int updateTodoCheckTrue(int tdno) throws Exception{
		System.out.println("todocheckt dao");
		System.out.println(tdno);
		return sqlSession.update("updateTodoCheckTrue",tdno);
	}
	public int updateTodoDate(TodoDto tddto) throws Exception{
		return sqlSession.update("updateTodoDate",tddto);
	}
	public int updateTodoUno(TodoDto tddto) throws Exception{
		return sqlSession.update("updateTodoUno",tddto);
	}
}
