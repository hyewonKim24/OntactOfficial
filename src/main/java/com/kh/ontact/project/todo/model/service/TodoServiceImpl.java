package com.kh.ontact.project.todo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.alert.model.dto.AlertDto;
import com.kh.ontact.alert.model.service.AlertService;
import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllViewDto;
import com.kh.ontact.project.todo.model.dao.TodoDao;
import com.kh.ontact.project.todo.model.dto.TodoDto;
import com.kh.ontact.project.todo.model.dto.TodoViewDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.projectMember.model.service.ProjectMemberService;
import com.kh.ontact.users.model.dto.UsersDto;

@Service("todoService")
public class TodoServiceImpl implements TodoService{
	@Autowired
	private TodoDao todoDao;
	@Autowired
	private BoardAllDao boardallDao;
	//혜원 알림기능 추가
	@Autowired
	ProjectMemberService pmService;
	@Autowired
	AlertService alertService;

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
			//알림 기능 ( 나 제외한 프로젝트 멤버들에게 알림 추가 ) 
			ProjectMemberDto pmdto= new ProjectMemberDto();
			pmdto.setUno(ball.getUno());
			pmdto.setPno(ball.getPno());
			AlertDto adto = null;
			List<String> plist =pmService.AlertProList(pmdto);
			System.out.println("프로젝트 리스트:"+plist);
			int ars = 0;
			for(int i=0;i<plist.size();i++) {
				adto = new AlertDto();
				adto.setUno(plist.get(i));
				adto.setPno(ball.getPno());
				adto.setAcontent(ball.getUname()+"님이 ["+ball.getBname()+"]글을 1개 등록했습니다.");
				ars += alertService.alertInsert(adto);
			}
			System.out.println("일반글"+ars+"개 알림등록");
			//혜원 끝
			
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
