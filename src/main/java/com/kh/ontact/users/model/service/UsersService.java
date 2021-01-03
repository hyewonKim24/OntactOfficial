package com.kh.ontact.users.model.service;

import java.util.List;

import com.kh.ontact.company.model.dto.CompanyDto;
import com.kh.ontact.users.model.dto.UsersDto;

public interface UsersService {
	public void joinBusiness(UsersDto userdto, CompanyDto companydto) throws Exception;
	public int emailChk(String uemail) throws Exception;
	
	//시큐리티
	void countFailure(String username);
	int checkFailureCount(String username);
	void disabledUsername(String username);
	void resetFailureCnt(String username);
	
	
	//채팅
	public List<UsersDto> ChatUsersList(UsersDto dto) throws Exception;
	
}
