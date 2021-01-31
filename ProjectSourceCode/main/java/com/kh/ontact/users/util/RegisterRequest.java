package com.kh.ontact.users.util;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class RegisterRequest {
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
	
//	//비밀번호 확인
//	public boolean isPwEqualToCheckPw() {
//		return upwd.equals(upwdre);
//	}
	
//	@AssertTrue(message = "비밀번호가 일치하지 않습니다.")
//	public boolean isPassowrdCompare() {
//		// 이전에 빈값을 검증하기 때문에 널 검사는 제외한다. (null pointer 예외를 피하기 위함)
//		if (this.upwd == null || this.upwdre == null) {
//			return true;
//		}
//		return this.upwd.equals(this.upwdre);
//	}

	
	@NotEmpty(message="회사명을 입력해주세요.")
	private String cname;
	
	@NotEmpty(message="URL을 입력해주세요.")
	//@URL(message="URL형식에 맞게 입력해주세요.")
	@Pattern(regexp="^[A-Za-z0-9+]{3,50}$", message="3~50자 영문,숫자만 가능합니다.")
	private String curl;
	
	@NotEmpty(message="직종을 선택해주세요.")
	private String ccate;
	
}
