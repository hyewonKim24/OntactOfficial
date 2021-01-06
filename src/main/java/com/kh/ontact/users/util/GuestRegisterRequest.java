package com.kh.ontact.users.util;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class GuestRegisterRequest {
	@NotEmpty(message="이메일을 입력해주세요.")
	@Email(message="이메일 형식에 맞게 입력해주세요.")
	private String uemail;
	
	@Length(min=2, max=6, message = "이름을 공백없이 2~6자로 입력해주세요.")
	@NotEmpty(message="이름을 입력해주세요.")
	private String uname;
	
	@NotEmpty(message="비밀번호를 입력해주세요.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}",
	message="비밀번호를 형식에 맞게 입력해주세요.")
	private String upwd;
	
	//비밀번호체크
	@NotEmpty(message="비밀번호를 한번 더 입력해주세요.")
	private String upwdre;
	
	@NotEmpty(message="URL을 입력해주세요.")
	//@URL(message="URL형식에 맞게 입력해주세요.")
	@Pattern(regexp="^[A-Za-z0-9+]{3,50}$", message="3~50자 영문,숫자만 가능합니다.")
	private String curl;
	
}
