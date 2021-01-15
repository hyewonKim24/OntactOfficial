package com.kh.ontact.users.model.service;

import java.util.HashMap;
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
	public CompanyDto findCompany(String cno) throws Exception;
	public String dnameChk(String dno) throws Exception;
	public int updateUrank(HashMap<String, String> paramMap) throws Exception;
	public int updateUtell(HashMap<String, String> paramMap) throws Exception;
	public int updateCname(HashMap<String, String> paramMap) throws Exception;
	public int updateCtel(HashMap<String, String> paramMap) throws Exception;
	
	//시큐리티
	void countFailure(String username);
	int checkFailureCount(String username);
	void disabledUsername(String username);
	void resetFailureCnt(String username);
	
	
	//채팅
	List<UsersDto> ChatUsersList(UsersDto dto) throws Exception;
	UsersDto ChatUserDetail(String uemail) throws Exception	;
	
	//프로젝트
	List<UsersDto> listTaskRes(String pno) throws Exception;
	
	
	// 조직도
	public int listCountFirst();
	public List<UsersDto> selectOgFirst(int startPage, int limit);
	public int listCount();
	public List<UsersDto> selectOgUser(int startPage, int limit);
	public int updateDept(UsersDto u); 
		
}
