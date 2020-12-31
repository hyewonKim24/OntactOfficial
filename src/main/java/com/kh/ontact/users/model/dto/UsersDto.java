package com.kh.ontact.users.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class UsersDto {
	private String uno;
	private String cno;
	private String dno;
	private String uemail;
	private String uname;
	private int utell;
	private String upwd;
	private String utmppwd;
	private String urank;
	private Date uregdate;
	private Date uresdate;
	private int ustate;
	private String ufilename;
	private String ufilepath;
	private String uauthority;
	private int enabled;
	
	
	
	public UsersDto(String uno, String cno, String uemail, String uname, String upwd, String urank, String uauthority,
			int enabled) {
		super();
		this.uno = uno;
		this.cno = cno;
		this.uemail = uemail;
		this.uname = uname;
		this.upwd = upwd;
		this.urank = urank;
		this.uauthority = uauthority;
		this.enabled = enabled;
	}

	
}
