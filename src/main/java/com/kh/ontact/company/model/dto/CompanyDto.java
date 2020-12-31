package com.kh.ontact.company.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class CompanyDto {
	private String cno;
	private String cname;
	private String ceo;
	private int ctel;
	private String curl;
	private String clogo;
	private String clogopath;
	private String ccate;
	
	
	
	public CompanyDto(String cno, String cname, String ceo, String curl, String ccate) {
		super();
		this.cno = cno;
		this.cname = cname;
		this.ceo = ceo;
		this.curl = curl;
		this.ccate = ccate;
	}



	@Override
	public String toString() {
		return "CompanyDto [cno=" + cno + ", cname=" + cname + ", ceo=" + ceo + ", ctel=" + ctel + ", curl=" + curl
				+ ", clogo=" + clogo + ", clogopath=" + clogopath + ", ccate=" + ccate + "]";
	}
	
	

}
