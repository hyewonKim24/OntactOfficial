package com.kh.ontact.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectTaskController {
	
	//혜원 코드
	@RequestMapping(value="/project/projecttest",method=RequestMethod.GET)
	public ModelAndView headerTEST(ModelAndView mv) {
		mv.setViewName("project/projectmaintest");
		return mv;
	}
	
	//업무 내용 insert
		@RequestMapping(value="/project/taskinsert",method=RequestMethod.POST)
		public ModelAndView taskinsert(ModelAndView mv, @RequestParam(name = "tasktitle") String tasktitle,
				@RequestParam(name = "taskname") String taskname,@RequestParam(name = "taskstartdate") String taskstartdate,
				@RequestParam(name = "taskenddate") String taskenddate,@RequestParam(name = "trate") String trate,
				@RequestParam(name = "taskpri") String taskpri,@RequestParam(name = "taskopen") String taskopen) {
				System.out.println("제목"+tasktitle);
				System.out.println("taskname"+taskname);
				System.out.println("taskstartdate"+taskstartdate);
				System.out.println("taskenddate"+taskenddate);
				System.out.println("trate"+trate);
				System.out.println("taskpri"+taskpri);
				System.out.println("taskopen"+taskopen);
				//값 다 들어오는지 확인
				
				
				
				
			
			
				mv.setViewName("project/projectmaintest");
			return mv;
		}
		
	
}
