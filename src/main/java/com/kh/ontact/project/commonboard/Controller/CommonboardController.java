package com.kh.ontact.project.commonboard.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		public String main() {
			return "project/project";
		}
		
		@RequestMapping("/ins")
		public String insertCommonboard(FilesDto file, BoardAllDto alldto, CommonboardDto comdto) {
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String uno = user.getUno();
			alldto.setUno(uno);
			for(int i=0; i<file.getFilelist().size(); i++) {
				System.out.println(file.getFilelist().get(i).getFname());
				System.out.println(file.getFilelist().get(i).getFpath()); 
				System.out.println(file.getFilelist().get(i).getFsize()); 
				System.out.println(file.getFilelist().get(i).getUno()); 
			}
			 try {
				commonboardservice.insertCommonboard(file, alldto, comdto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			 
			return "redirect:/project/commonboard/cboard";
		}
}
