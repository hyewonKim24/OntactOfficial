package com.kh.ontact.users.exception;

public class AlreadyExistingEmailException extends RuntimeException{
	 public AlreadyExistingEmailException(String message) {
	        super(message);
	    }
}
