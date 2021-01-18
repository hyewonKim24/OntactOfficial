package com.kh.ontact.project.commonboard.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.commonboard.model.service.CommonboardService;
import com.kh.ontact.project.files.model.dto.FilesDto;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@RequestMapping("/project/commonboard")
@Controller
public class CommonboardController {
	@Autowired
	CommonboardService commonboardservice;
	
	// 메인화면 이동
		@RequestMapping("/cboard")
		public ModelAndView getFileboard() {
			ModelAndView mv = new ModelAndView();
			String pno = "22";
			try {
				mv.addObject("blist", commonboardservice.getCommonboard());
				mv.addObject("file", commonboardservice.getFileboard(pno));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.setViewName("project/project");
			return mv;
		}
		
		@RequestMapping("/ins")
		public String insertCommonboard(FilesDto file, BoardAllDto alldto, CommonboardDto comdto) {
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String uno = user.getUno();
			alldto.setUno(uno);
			alldto.setBtype(1);
			System.out.println(file.getFilelist());
			
			 try {
				commonboardservice.insertCommonboard(file, alldto, comdto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			 
			return "redirect:/project/commonboard/cboard";
		}
		
		@RequestMapping("/del")
		public String deleteCommonboard(@RequestParam int bno) {
			 try {
				commonboardservice.deleteCommonboard(bno);
			} catch (Exception e) {
				e.printStackTrace();
			}
			 
			return "redirect:/project/commonboard/cboard";
		}
}
