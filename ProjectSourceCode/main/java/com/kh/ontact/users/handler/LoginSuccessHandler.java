package com.kh.ontact.users.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.kh.ontact.users.model.service.UsersService;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	private String uemail;
	private String defaultUrl;

	@Autowired
	private UsersService usersService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.info("로그인성공");
		String username = request.getParameter(uemail);
		
		//로그인실패횟수 초기화
		usersService.resetFailureCnt(username);

		//에러 세션 지우기
		clearAuthenticationAttributes(request);

		//Redirect URL 작업
		resultRedirectStrategy(request, response, authentication);
	}
	
	//로그인실패횟수 초기화
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session==null) return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	//로그인 후 url 설정
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
//        
//        SavedRequest savedRequest = requestCache.getRequest(request, response);
//        
//        if(savedRequest!=null) {
//            String targetUrl = savedRequest.getRedirectUrl();
//            redirectStratgy.sendRedirect(request, response, targetUrl);
//            //권한있는 페이지
//        } else {
            redirectStratgy.sendRedirect(request, response, defaultUrl);
//            //로그인페이지
//        }
//        
    }

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

}
