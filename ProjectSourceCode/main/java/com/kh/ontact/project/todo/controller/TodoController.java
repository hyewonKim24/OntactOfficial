package com.kh.ontact.project.todo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.boardall.model.dto.BoardAllViewDto;
import com.kh.ontact.project.todo.model.dto.TodoDto;
import com.kh.ontact.project.todo.model.service.TodoService;
import com.kh.ontact.users.model.dto.CustomUserDetails;


@Controller
public class TodoController {
	@Autowired
	private TodoService todoService;
	
	//윤진 : todo 디테일로 들어가기
	@SuppressWarnings("finally")
	@RequestMapping(value="project/todo",  method = RequestMethod.GET)
	public ModelAndView selectTodoList(ModelAndView mv, Authentication authentication, BoardAllViewDto ball){
		try {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno = userdetail.getUno();
		System.out.println("내 uno" + uno);
		List<BoardAllViewDto> todoList = todoService.getBoardAllList(uno);
		System.out.println("할일목록:" + todoList);
		ball.setUno(uno);
		
	     mv.addObject("todoList", todoList);
	     mv.setViewName("project/todo");
	     
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			return mv;
		}
	}
	
	//윤진 : 할일 todo insert
	@RequestMapping(value="project/todoinsert",  method = RequestMethod.GET)
	public ModelAndView todoinsert(ModelAndView mv, Authentication authentication,
			@RequestParam(name= "pno") String pno,
			@RequestParam(name= "bname") String bname,
			@RequestParam(name= "bopen") int bopen,
			@RequestParam(name= "tdcontent") List<String> tdcontent,
			@RequestParam(name= "tddate")List<String> tddate,
			@RequestParam(name= "tduno")List<String> tduno
			){
			System.out.println("controller진입");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno=userdetail.getUno();
			String uname=userdetail.getUname();
			
			BoardAllDto bdto= new BoardAllDto();
			bdto.setPno(pno);
			bdto.setUno(uno);
			bdto.setUname(uname);
			bdto.setBname(bname);
			bdto.setBopen(bopen);
			System.out.println("boardAllDto"+ bdto);
			System.out.println("b:"+pno+bname+bopen);
			System.out.println("tdcontent:"+tdcontent+"tddate:"+tddate+"tduno:"+tduno);
			List<TodoDto> tdlist = new ArrayList<TodoDto>();
			TodoDto td = null;
			
			try {
				for(int i =0; i<tdcontent.size(); i++) {
					td = new TodoDto();
					td.setTdcontent(tdcontent.get(i));
					td.setTddate(tddate.get(i));
					td.setTdresponsibility(tduno.get(i));
					tdlist.add(td);
				}
				todoService.insertTodo(bdto, tdlist);
			}catch(Exception e) {
				e.printStackTrace();
			}
			mv.addObject("pno", pno);
			mv.setViewName("redirect:/project/pjdetail");
			return mv;
			
	}
	
	//윤진 : 할일 todo update ajax
	//todo checkbox true
	@ResponseBody
	@RequestMapping(value="/project/tdchecktrue")
	public int todochecktrue(ModelAndView mv, int tdno, String pno) {
		int rs = 0;
		try {
			rs=todoService.updateTodoCheckTrue(tdno);
			System.out.println("tdCheck:"+rs);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//todo checkbox false
	@ResponseBody
	@RequestMapping(value="/project/tdcheckfalse")
	public int todocheckfalse(ModelAndView mv, int tdno, String pno) {
		int rs = 0;
		try {
			rs=todoService.updateTodoCheckFalse(tdno);
			System.out.println("tdCheck:"+rs);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//todo date 마감일 변경
	@ResponseBody
	@RequestMapping(value="/project/tddateupdate")
	public int tododateUpdate(ModelAndView mv, int tdno, String tddate) {
		int rs = 0;
		TodoDto tddto= new TodoDto();
		tddto.setTdno(tdno);
		tddto.setTddate(tddate);
		try {
			rs=todoService.updateTodoDate(tddto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//todo 담당자 변경
	@ResponseBody
	@RequestMapping(value="/project/tdunoupdate")
	public int todounoUpdate(ModelAndView mv, int tdno, String tduno) {
		int rs = 0;
		TodoDto tddto= new TodoDto();
		tddto.setTdno(tdno);
		tddto.setTddate(tduno);
		try {
			rs=todoService.updateTodoUno(tddto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//혜원 : 할일 삭제
	@RequestMapping(value="/project/tododelete",method=RequestMethod.GET)
	public ModelAndView taskdelete(ModelAndView mv, @RequestParam(name = "bno") int bno,
			@RequestParam(name = "pno") String pno) {
		System.out.println("bno"+bno);
		System.out.println("pno"+pno);
		int rs =0;
		try {
			rs =todoService.deleteTodo(bno);
			System.out.println("할 일 "+rs+"개 삭제 : task");
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("pno", pno);
		mv.addObject("deleteResult", rs);
		mv.setViewName("redirect:/project/pjdetail");
		return mv;
	}
}
