package com.kh.ontact.users.handler;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.kh.ontact.users.model.service.UsersService;
import com.kh.ontact.users.util.MessageUtils;

public class LoginFailureHandler implements AuthenticationFailureHandler{
	private String uemail;
	private String upwd;
	private String ERRORMSG;
	private String defaultFailureUrl;
	
	@Resource(name="usersService")
	private UsersService usersService;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String username = request.getParameter(uemail);
		String password = request.getParameter(upwd);
		String errormsg = null;
		if(exception instanceof BadCredentialsException) {
			loginFailureCount(username);
			errormsg = MessageUtils.getMessage("error.BadCredentials");
			// 비밀번호 일치x
		}
//		else if (exception instanceof UsernameNotFoundException) {
//			errormsg = MessageUtils.getMessage("error.UsernameNotFoundException");
//		}
		else if(exception instanceof InternalAuthenticationServiceException) {
			errormsg = MessageUtils.getMessage("error.BadCredentials");
			// 존재하지 않는 아이디 (비밀번호 일치 x 와 같은 메세지 뿌려줌)
		} else if(exception instanceof DisabledException) {
			errormsg = MessageUtils.getMessage("error.Disaled");
			// 계정 비활성화
		} else if(exception instanceof CredentialsExpiredException) {
			errormsg = MessageUtils.getMessage("error.CredentialsExpired");
			// 비밀번호 유효기간 만료
		}
		System.out.println(defaultFailureUrl);
		request.setAttribute(uemail, username);
		request.setAttribute(upwd, password);
		request.setAttribute(ERRORMSG, errormsg);
		
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}
	
	//로그인실패 카운터
	protected void loginFailureCount(String username) {
		usersService.countFailure(username);
		int cnt = usersService.checkFailureCount(username);
		if(cnt==10) {
			usersService.disabledUsername(username);
			//비밀번호 10번 이상 틀릴시 계정잠금
		}
	}


	

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	

	public String getERRORMSG() {
		return ERRORMSG;
	}

	public void setERRORMSG(String eRRORMSG) {
		ERRORMSG = eRRORMSG;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

}
