package com.kh.ontact.users.controller;

import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.commons.util.UploadFileUtils;
import com.kh.ontact.company.model.dao.CompanyDao;
import com.kh.ontact.company.model.dto.CompanyDto;
import com.kh.ontact.users.exception.AlreadyExistingCurlException;
import com.kh.ontact.users.exception.AlreadyExistingEmailException;
import com.kh.ontact.users.exception.NotExistingCurlException;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.model.service.EmailService;
import com.kh.ontact.users.model.service.UsersService;
import com.kh.ontact.users.util.GuestRegisterRequest;
import com.kh.ontact.users.util.PwdRegisterRequest;
import com.kh.ontact.users.util.RegisterRequest;

@Controller
@EnableAsync
public class UsersMainController {
	@Autowired
	UsersService usersService;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@Autowired
	EmailService emailService;

	private static final Logger logger = LoggerFactory.getLogger(UsersMainController.class);

	// 메인화면 이동
	@RequestMapping("/main")
	public String main() {
		return "users/main";
	}

	// 비즈니스 회원가입창 이동
	@RequestMapping(value = "/main/busjoin", method = RequestMethod.GET)
	public ModelAndView joinBusiness() {
		ModelAndView mv = new ModelAndView("users/businessregister");
		mv.addObject("registerRequest", new RegisterRequest());
		return mv;
	}

	// 비즈니스 회원가입 인서트
	@RequestMapping(value = "/main/busjoin", method = RequestMethod.POST)
	public String joinBusiness(UsersDto userdto, CompanyDto companydto) {
		logger.info("userInfo");
		try {
			// 비밀번호 암호화
			String inputPass = userdto.getUpwd();
			String pwd = pwdEncoder.encode(inputPass);
			userdto.setUpwd(pwd);

			String uname = userdto.getUname();
			companydto.setCeo(uname);
			usersService.joinBusiness(userdto, companydto); // 가입메소드
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/main/loginform";
	}

	// 비즈니스 회원가입 유효성 검사 (에이작스용^^)
	@ResponseBody
	@RequestMapping(value = "/main/busjoinchecktest")
	public String joinBusinessChk(@Valid RegisterRequest regReq, BindingResult bindingResult) throws Exception {
		String test = null;
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			test = "aaa";
		}
		try {
			usersService.joinBusinessChk(regReq);
		} catch (AlreadyExistingEmailException e) {
			bindingResult.rejectValue("uemail", "duplicate", "이미 가입된 이메일입니다.");
			test = "aaa";
		} catch (AlreadyExistingCurlException e) {
			bindingResult.rejectValue("curl", "duplicate", "이미 등록된 url입니다.");
			test = "aaa";
		} catch (Exception e) {
			e.printStackTrace();
		}

		// return "redirect:busjoincheck";
		return test;
	}

	// 비즈니스 회원가입 유효성 검사 (폼용)
	@RequestMapping(value = "/main/busjoincheck")
	public ModelAndView joinBusinessChk(@Valid RegisterRequest regReq, BindingResult bindingResult,
			HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");

		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
		}
		try {
			usersService.joinBusinessChk(regReq);
		} catch (AlreadyExistingEmailException e) {
			bindingResult.rejectValue("uemail", "duplicate", "이미 가입된 이메일입니다.");
		} catch (AlreadyExistingCurlException e) {
			bindingResult.rejectValue("curl", "duplicate", "이미 등록된 url입니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("users/businessregister");
		return mv;
	}

	// 가입 인증번호 메일 발송
	@RequestMapping(value = "/main/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String uemail) throws Exception {

		// 뷰(View)로부터 넘어온 데이터 확인
		logger.info("이메일 : " + uemail);

		// 인증번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호" + checkNum);

		String setFrom = "ssak.git@gmail.com";
		String toMail = uemail;
		String title = "회원가입 인증 이메일입니다.";
		String content = "안녕하세요. 본 메일은 '온택트' 가입 시," + "<br>" + "본인 확인을 위해 발송되는 메일입니다." + "<br><br>" + "인증번호는 "
				+ checkNum + "입니다." + "<br>" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		try {
			emailService.mailSend(setFrom, toMail, title, content);

		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
	}

	// 유저 회원가입 이동
	@RequestMapping(value = "/main/guestjoin", method = RequestMethod.GET)
	public ModelAndView joinGuest() {
		ModelAndView mv = new ModelAndView("users/guestregister");
		mv.addObject("guestRegisterRequest", new GuestRegisterRequest());
		return mv;
	}

	// 유저 회원가입 인서트
	@RequestMapping(value = "/main/guestjoin", method = RequestMethod.POST)
	public String joinGuest(@RequestParam String curl, UsersDto userdto) {
		System.out.println(curl);
		try {
			// cno 찾아옴
			String cno = usersService.findCno(curl);
			userdto.setCno(cno);
			// 비밀번호 암호화
			String inputPass = userdto.getUpwd();
			String pwd = pwdEncoder.encode(inputPass);
			userdto.setUpwd(pwd);
			
			String pno = usersService.findCname(curl);
			
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("cno",cno);
			paramMap.put("pno",pno);
			usersService.joinGuest(userdto, paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/main/loginform";
	}

	// 게스트 회원가입 유효성 검사 (에이작스용)
	@ResponseBody
	@RequestMapping(value = "/main/guestjoinchecktest")
	public String joinGuestChk(@Valid GuestRegisterRequest regReq, BindingResult bindingResult) throws Exception {
		String test = null;
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			test = "aaa";
		}
		try {
			usersService.joinGuestChk(regReq);
		} catch (AlreadyExistingEmailException e) {
			bindingResult.rejectValue("uemail", "duplicate", "이미 가입된 이메일입니다.");
			test = "aaa";
		} catch (NotExistingCurlException e) {
			bindingResult.rejectValue("curl", "duplicate", "존재하지 않는 url입니다.");
			test = "aaa";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return test;
	}

	// 게스트 회원가입 유효성 검사 (폼용)
	@RequestMapping(value = "/main/guestjoincheck")
	public ModelAndView joinGuestChk(@Valid GuestRegisterRequest regReq, BindingResult bindingResult,
			HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");

		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
		}
		try {
			usersService.joinGuestChk(regReq);
		} catch (AlreadyExistingEmailException e) {
			bindingResult.rejectValue("uemail", "duplicate", "이미 가입된 이메일입니다.");
		} catch (NotExistingCurlException e) {
			bindingResult.rejectValue("curl", "duplicate", "존재하지 않는 url입니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("users/guestregister");
		return mv;
	}

	// 로그인페이지로 이동
	@RequestMapping(value = "/main/loginform")
	public String loginForm() {
		logger.info("Welcome Login Form!");

		return "users/login";
	}

	// 비밀번호 찾기 이동
	@RequestMapping(value = "/main/pwdforget", method = RequestMethod.GET)
	public ModelAndView forgetpwd() {
		ModelAndView mv = new ModelAndView("users/pwdforget");
		mv.addObject("pwdRegisterRequest", new PwdRegisterRequest());
		return mv;
	}

	// 비밀번호 찾기 유효성 검사
	@RequestMapping(value = "/main/pwdforgetmail", method = RequestMethod.GET)
	public ModelAndView updateTmppwd() {
		ModelAndView mv = new ModelAndView("users/pwdforget");
		mv.addObject("pwdRegisterRequest", new PwdRegisterRequest());
		return mv;
	}

	// 임시비밀번호 만드는 메소드
	private String getRamdomPassword(int size) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&' };
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int idx = 0;
		int len = charSet.length;
		for (int i = 0; i < size; i++) {
			idx = (int) (len * Math.random());
			idx = sr.nextInt(len); // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}

	// 비밀번호 찾기(임시비밀번호 발급)
	@RequestMapping(value = "/main/pwdforgetmail", method = RequestMethod.POST)
	public ModelAndView updateTmppwd(@Valid PwdRegisterRequest regReq, BindingResult bindingResult, UsersDto userdto)
			throws Exception {
		String uemail = userdto.getUemail();
		logger.info("이메일 : " + uemail);
		// 임시비밀번호 생성
		String tempwd = getRamdomPassword(8);

		// 메일 세팅
		String setFrom = "ssak.git@gmail.com";
		String toMail = uemail;
		String title = "[ontact] 요청하신 임시 비밀번호 입니다.";
		String content = "";
		content += "<div align='center' style='border 1px solid black; font-family:verdana'>";
		content += "<h3 style='color:blue;'><strong>";
		content += "요청하신 임시 비밀번호입니다. 로그인 후 비밀번호를 변경해주세요.";
		content += "<p>임시 비밀번호 : <strong>" + tempwd + "</strong></p></div>";

		ModelAndView mv = new ModelAndView();

		// 유효성, 이메일 유무 체크
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			mv.setViewName("/users/pwdforget");
			return mv;
		}
		try {
			usersService.pwdChk(userdto);
		} catch (NotExistingCurlException e) {
			bindingResult.rejectValue("uemail", "duplicate", "입력하신 정보가 등록되어 있지 않습니다.");
			mv.setViewName("/users/pwdforget");
			return mv;
		}

		try {
			// 비밀번호 암호화
			String inputPass = tempwd;
			String pwd = pwdEncoder.encode(inputPass);
			userdto.setUpwd(pwd);
			System.out.println("임시비번임~ : "+inputPass);
			System.out.println("암호화된비밀번호:" + userdto.getUpwd());
			// 비밀번호 업데이트
			usersService.updateTmppwd(userdto);
			// 메일 발송
			emailService.mailSend(setFrom, toMail, title, content);

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("success", "비밀번호 변경메일을 보냈습니다.");
		mv.setViewName("users/login");
		return mv;
	}

	// 마이페이지 - 계정정보
	@RequestMapping(value = "/user/mypage/detail", method = RequestMethod.GET)
	public ModelAndView mypage(UsersDto userdto) {
		ModelAndView mv = new ModelAndView();
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		String dno = user.getDno();
		String cno = user.getCno();
		String dname = null;
		try {
			if (dno == null) {
				dname = "미지정";
			} else {
				dname = usersService.dnameChk(dno);
			}
			mv.addObject("company", usersService.findCompany(cno));
			System.out.println(usersService.findCompany(cno));
			mv.addObject("dname", dname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("users/myinfo");
		return mv;
	}

	// 프로필 업데이트
	@RequestMapping(value = "/user/mypage/profile", method = RequestMethod.POST)
	public String updateProfile(@RequestParam String ufilename, @RequestParam String ufilepath) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		String uno = user.getUno();
		HashMap<String, String> paramMap = new HashMap<String, String>();
		try {
			paramMap.put("uno", uno);
			paramMap.put("ufilename", ufilename);
			paramMap.put("ufilepath", ufilepath);
			System.out.println(ufilepath+"패스");
			System.out.println(ufilename+"네임");
			usersService.updateProfile(paramMap);
			user.setUfilepath(ufilepath);
			user.setUfilename(ufilename);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		return "redirect:/user/mypage/detail";
	}

	// 프로필사진 삭제 (DB 삭제)
	@RequestMapping(value = "user/mypage/delProfile", method = RequestMethod.POST)
	public String deleteProfile() {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		String uno = user.getUno();
		try {
			usersService.deleteProfile(uno);
			user.setUfilepath("");
			user.setUfilename("");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/mypage/detail";
	}

	// 프로필사진 삭제 (사진 삭제)
	@RequestMapping(value = "user/mypage/delPreviewProfile", method = RequestMethod.POST)
	public String deleteFile(@RequestParam(value = "ufilename") String fileName, HttpServletRequest request) {
		//ResponseEntity<String> entity = null;
		try {
			UploadFileUtils.deleteFile(fileName, request);
			// deleteFile()은 이미지 타입 여부를 판별함. 이미지 파일일 경우 원본 이미지 삭제/썸네일 삭제, 일반파일일 경우 파일 삭제처리
			//entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
			logger.info("들어옴"+fileName+"나는야 유저");
		} catch (Exception e) {
			e.printStackTrace();
			//entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return "redirect:/user/mypage/detail";
	}

	// 마이페이지 - 계정정보 업데이트
	@ResponseBody
	@RequestMapping(value = "/user/mypage/updutell", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String updateUtell(@RequestParam(required = false) String utell) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		String uno = user.getUno();
		String result = "aaa";
		String tell_chk = "(^[0-9]*$)";
		HashMap<String, String> paramMap = new HashMap<String, String>();
		try {
			Pattern pattern_symbol = Pattern.compile(tell_chk);
			Matcher matcher_symbol = pattern_symbol.matcher(utell);
			if (matcher_symbol.find()) {
				paramMap.put("uno", uno);
				paramMap.put("utell", utell);
				logger.info("utell : " + utell + "원래 utell : " + user.getUtell() + "업데이트");
				// 업데이트
				usersService.updateUtell(paramMap);
				user.setUtell(utell);
				result = "변경";
			} else {
//				result = "숫자만 입력해주세요.";
				System.out.println(matcher_symbol.find());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/user/mypage/updurank", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String updateUrank(@RequestParam(required = false) String urank) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		String uno = user.getUno();
		String result = "aaa";
		String urank_chk = "[!@#$%^&*(),.?\\\":{}|<>]";
		System.out.println("urank는 : "+urank);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		try {
			Pattern pattern_symbol = Pattern.compile(urank_chk);
			Matcher matcher_symbol = pattern_symbol.matcher(urank);
			if (!matcher_symbol.find()) {
				paramMap.put("uno", uno);
				paramMap.put("urank", urank);
				logger.info("urank : " + urank + "원래 urank : " + user.getUrank() + "업데이트");
				// 업데이트
				usersService.updateUrank(paramMap);
				user.setUrank(urank);
				result = "변경";
			} else {
				System.out.println(matcher_symbol.find());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/user/mypage/updcname", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String updateCname(@RequestParam(required = false) String cname) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		String cno = user.getCno();
		String result = "aaa";
		String cname_chk = "[!@#$%^&*(),.?\\\":{}|<>]";
		HashMap<String, String> paramMap = new HashMap<String, String>();
		try {
			Pattern pattern_symbol = Pattern.compile(cname_chk);
			Matcher matcher_symbol = pattern_symbol.matcher(cname);
			if (!matcher_symbol.find()) {
				paramMap.put("cno", cno);
				paramMap.put("cname", cname);
				// 업데이트
				usersService.updateCname(paramMap);
				result = "변경";
			} else {
				System.out.println(matcher_symbol.find());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/user/mypage/updctel", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String updateCtel(@RequestParam(required = false) String ctel) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		String cno = user.getCno();
		String result = "aaa";
		String tell_chk = "(^[0-9]*$)";
		HashMap<String, String> paramMap = new HashMap<String, String>();
		try {
			Pattern pattern_symbol = Pattern.compile(tell_chk);
			Matcher matcher_symbol = pattern_symbol.matcher(ctel);
			if (matcher_symbol.find()) {
				paramMap.put("cno", cno);
				paramMap.put("ctel", ctel);
				// ctel 업데이트
				usersService.updateCtel(paramMap);
				result = "변경";
			} else {
				System.out.println(matcher_symbol.find() + "실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 마이페이지 - 비밀번호 변경 페이지로 이동
	@RequestMapping(value = "/user/mypage/updpwd", method = RequestMethod.GET)
	public String updatePwd(UsersDto userdto) {
		return "users/pwdsetting";
	}

	// 마이페이지 - 비밀번호 변경
	@RequestMapping(value = "/user/mypage/updpwd", method = RequestMethod.POST)
	public ModelAndView updatePwdCheck(@RequestParam String nowpwd, UsersDto userdto) {
		ModelAndView mv = new ModelAndView();
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		String uno = user.getUno();
		
		try {
			String realpwd = usersService.getpwd(uno);
			String upwd = nowpwd; // 사용자가 입력한 현재 비밀번호
			System.out.println(realpwd + "그리고" + nowpwd);
			System.out.println(userdto.getUpwd());
			if (!pwdEncoder.matches(upwd, realpwd)) {
				logger.info("비밀번호 틀림");
				mv.addObject("message", "이전 비밀번호가 올바르지 않습니다.");
				mv.setViewName("users/pwdsetting");
				return mv;
			} else {
				logger.info("비밀번호 일치함");
				// 비밀번호 업데이트
				String inputPass = userdto.getUpwd();
				String pwd = pwdEncoder.encode(inputPass);
				userdto.setUpwd(pwd);
				userdto.setUemail(user.getUsername());
				usersService.updateTmppwd(userdto);
			}
			mv.addObject("success", "비밀번호 변경이 되었습니다.");
			mv.setViewName("users/pwdsetting");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}

	// 권한 없음 페이지
	@RequestMapping(value = "error/access_denied", method = RequestMethod.GET)
	public String accessDeniedPage() {
		logger.info("접근권한없음");
		return "users/accessDenied";
	}

	// 관리자권한 테스트용
	@RequestMapping(value = "/admin/adminHome.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome Admin Home!");

		return "admin/adminHome";
	}

}
