package com.kh.ontact.users.util;

import java.util.Locale;

import org.springframework.context.support.MessageSourceAccessor;

//에러메세지 처리를 위한 클래스
public class MessageUtils {
	private static MessageSourceAccessor msAcc = null;

	public void setMessageSourceAccessor(MessageSourceAccessor msAcc) {
		MessageUtils.msAcc = msAcc;
	}
	
	public static String getMessage(String code) {
		System.out.println(code+"??");
		return msAcc.getMessage(code, Locale.getDefault());
	}
	
	public static String getMessage(String code, Object[] objs) {
		return msAcc.getMessage(code, objs, Locale.getDefault());
	}
}
