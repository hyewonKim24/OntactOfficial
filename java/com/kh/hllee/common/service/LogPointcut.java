package com.kh.hllee.common.service;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LogPointcut {
	@Pointcut("execution(* com.kh.testMySpring..*Impl.*(..))")
	public void allPointcut() {
	}

	@Pointcut("execution(* com.kh.testMySpring..*Impl.get*(..))")
	public void getPointcut() {
	}
}
