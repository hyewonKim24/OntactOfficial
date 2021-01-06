package com.kh.ontact.users.model.service;

import java.util.List;

import com.kh.ontact.company.model.dto.CompanyDto;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.util.GuestRegisterRequest;
import com.kh.ontact.users.util.PwdRegisterRequest;
import com.kh.ontact.users.util.RegisterRequest;

public interface UsersService {
	public void joinBusiness(UsersDto userdto, CompanyDto companydto) throws Exception;
	public void joinBusinessChk(RegisterRequest regReq) throws Exception;
	public String findCno(String curl) throws Exception;
	public void joinGuest(UsersDto userdto) throws Exception;
	public void joinGuestChk(GuestRegisterRequest regReq) throws Exception;
	public void pwdChk(UsersDto userdto) throws Exception;
	public int updateTmppwd(UsersDto dto) throws Exception;
	
	//시큐리티
	void countFailure(String username);
	int checkFailureCount(String username);
	void disabledUsername(String username);
	void resetFailureCnt(String username);
	
	
	//채팅
	public List<UsersDto> ChatUsersList(UsersDto dto) throws Exception;
	
}
