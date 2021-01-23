package com.kh.ontact.users.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.ontact.company.model.dto.CompanyDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.util.GuestRegisterRequest;
import com.kh.ontact.users.util.PwdRegisterRequest;
import com.kh.ontact.users.util.RegisterRequest;

public interface UsersService {
	void joinBusiness(UsersDto userdto, CompanyDto companydto) throws Exception;
	void joinBusinessChk(RegisterRequest regReq) throws Exception;
	String findCno(String curl) throws Exception;
	String findCname(String curl) throws Exception;
	void joinGuest(UsersDto userdto, HashMap<String,String> paramMap) throws Exception;
	void joinGuestChk(GuestRegisterRequest regReq) throws Exception;
	void pwdChk(UsersDto userdto) throws Exception;
	int updateTmppwd(UsersDto dto) throws Exception;
	CompanyDto findCompany(String cno) throws Exception;
	String dnameChk(String dno) throws Exception;
	int updateUrank(HashMap<String, String> paramMap) throws Exception;
	int updateUtell(HashMap<String, String> paramMap) throws Exception;
	int updateCname(HashMap<String, String> paramMap) throws Exception;
	int updateCtel(HashMap<String, String> paramMap) throws Exception;
	int updateProfile(HashMap<String, String> paramMap) throws Exception;
	int deleteProfile(String uno) throws Exception;
	
	//시큐리티
	void countFailure(String username);
	int checkFailureCount(String username);
	void disabledUsername(String username);
	void resetFailureCnt(String username);
	
	
	//채팅
	List<UsersDto> ChatUsersList(UsersDto dto) throws Exception;
	UsersDto ChatUserDetail(String uemail) throws Exception	;
	
	//프로젝트
	List<ProjectMemberDto> listProjectMember(String pno) throws Exception;
	List<UsersDto> projectInviteList(UsersDto dto) throws Exception;
	
	
	// 조직도
	public int listCountFirst();
	public List<UsersDto> selectOgFirst(int startPage, int limit);
	public int listCount(String dname);
	public List<UsersDto> selectOgUser(int startPage, int limit, String dname);
	public int updateDept(UsersDto u); 
	public List<UsersDto> deleteOgUser(String dname);
}
