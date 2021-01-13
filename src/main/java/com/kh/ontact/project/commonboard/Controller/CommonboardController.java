package com.kh.ontact.project.commonboard.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonboardController {
	// 메인화면 이동
		@RequestMapping("/cboard")
		public String main() {
			return "users/project/project";
		}
}
