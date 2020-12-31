package com.kh.ontact.users.model.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails{
	private String uemail;
	private String upwd;
	private String uno;
	private String cno;
	private String dno;
	private String uname;
	private int utell;
	private String urank;
	private Date uregdate;
	private Date uresdate;
	private int ustate;
	private String ufilename;
	private String ufilepath;
	private String uauthority;
	private boolean enabled;


	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(uauthority));
        return auth;
	}

	@Override
	public String getPassword() {
		return upwd;
	}

	@Override
	public String getUsername() {
		return uemail;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
		//계정이 만료되지 않았는지 리턴한다. (true: 만료안됨)
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
		//계정이 잠겨있지 않았는 지 리턴한다. (true : 잠기지 않음)
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
		//비밀번호가 만료되지 않았는 지 리턴한다. (true : 만료 안됨)
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}

	public String getUno() {
		return uno;
	}

	public void setUno(String uno) {
		this.uno = uno;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getDno() {
		return dno;
	}

	public void setDno(String dno) {
		this.dno = dno;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getUtell() {
		return utell;
	}

	public void setUtell(int utell) {
		this.utell = utell;
	}

	public String getUrank() {
		return urank;
	}

	public void setUrank(String urank) {
		this.urank = urank;
	}

	public Date getUregdate() {
		return uregdate;
	}

	public void setUregdate(Date uregdate) {
		this.uregdate = uregdate;
	}

	public Date getUresdate() {
		return uresdate;
	}

	public void setUresdate(Date uresdate) {
		this.uresdate = uresdate;
	}

	public int getUstate() {
		return ustate;
	}

	public void setUstate(int ustate) {
		this.ustate = ustate;
	}

	public String getUfilename() {
		return ufilename;
	}

	public void setUfilename(String ufilename) {
		this.ufilename = ufilename;
	}

	public String getUfilepath() {
		return ufilepath;
	}

	public void setUfilepath(String ufilepath) {
		this.ufilepath = ufilepath;
	}
	
	

}
