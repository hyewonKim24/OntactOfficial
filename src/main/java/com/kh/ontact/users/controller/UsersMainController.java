package com.kh.ontact.users.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.company.model.dto.CompanyDto;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.model.service.UsersService;

@Controller
public class UsersMainController {
	@Autowired
	UsersService usersService;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	private static final Logger logger = LoggerFactory.getLogger(UsersMainController.class);

	// 메인화면 이동
	@RequestMapping("/main")
	public String main() {
		return "users/main";
	}

	// 비즈니스 회원가입창 이동
	@RequestMapping(value = "/busjoin", method = RequestMethod.GET)
	public String joinBusiness() {
		return "users/join";
	}

	// 비즈니스 회원가입
	@RequestMapping(value = "/busjoin", method = RequestMethod.POST)
	public String joinBusiness(UsersDto userdto, CompanyDto companydto) {
		logger.info("userInfo");
		try {
			String inputPass = userdto.getUpwd();
			String pwd = pwdEncoder.encode(inputPass);
			userdto.setUpwd(pwd);
			String uname = userdto.getUname();
			companydto.setCeo(uname);
			usersService.joinBusiness(userdto, companydto); // 가입메소드
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "users/main";
	}

	// 아이디 중복체크
	@RequestMapping(value = "/emailChk", method = RequestMethod.POST)
	@ResponseBody
	public String emailChk(String uemail) {
		logger.info("memberIdChk() 진입");
		String val = null;
		try {
			int result = usersService.emailChk(uemail);
			logger.info("결과값 = " + result);
			if (result != 0) {
				val = "fail"; // 중복 아이디가 존재
			} else {
				val = "success"; // 중복 아이디 x
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
	}

	// 로그인페이지로 이동
	@RequestMapping(value = "/loginform")
	public String loginFor(Locale locale, Model model) {
		logger.info("Welcome Login Form!");

		return "users/login";
	}

//	//로그인
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public void loginPage(String error, String logout, Model model) {
//		logger.info("로그인 페이지로 이동~");
//		logger.info("err :" + error);
//		logger.info("logout : " + logout);
//		if (error != null) {
//			model.addAttribute("error", "로그인 실패");
//		}
//		if (logout != null) {
//			model.addAttribute("logout", "로그아웃");
//		}
//	}

	// 권한 없음 페이지
	@RequestMapping(value = "/access_denied", method = RequestMethod.GET)
	public String accessDeniedPage() {
		logger.info("접근권한없음");
		return "users/accessDenied";
	}

	@RequestMapping(value = "/login-processing", method = RequestMethod.POST)
	public void loginProcessing(String error) {
		logger.info("login-processing!");
		logger.info("err :" + error);
	}
	
	//관리자권한 테스트용
	@RequestMapping(value = "/admin/adminHome.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome Admin Home!");
		
		return "admin/adminHome";
	}

	// 유저 권한 테스트
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member() {
		return "intro/introduction";
	}

}
