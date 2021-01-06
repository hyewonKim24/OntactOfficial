package com.kh.ontact.users.util;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class PwdRegisterRequest {
	@NotEmpty(message="이메일을 입력해주세요.")
	@Email(message="이메일 형식에 맞게 입력해주세요.")
	private String uemail;
	
	@Length(min=2, max=6, message = "이름을 공백없이 2~6자로 입력해주세요.")
	@NotEmpty(message="이름을 입력해주세요.")
	private String uname;
}
