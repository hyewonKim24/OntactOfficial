package com.kh.ontact.users.model.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.company.model.dao.CompanyDao;
import com.kh.ontact.company.model.dto.CompanyDto;
import com.kh.ontact.dept.model.dao.DeptDao;
import com.kh.ontact.users.exception.AlreadyExistingCurlException;
import com.kh.ontact.users.exception.AlreadyExistingEmailException;
import com.kh.ontact.users.exception.NotExistingCurlException;
import com.kh.ontact.users.model.dao.UsersAuthDao;
import com.kh.ontact.users.model.dao.UsersDao;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.util.GuestRegisterRequest;
import com.kh.ontact.users.util.RegisterRequest;

@Service("usersService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	UsersDao usersDao;
	@Autowired
	CompanyDao companydao;
	@Autowired
	UsersAuthDao usersAuthDao;
	@Autowired
	DeptDao deptdao;

	private static final Logger logger = LoggerFactory.getLogger(UsersServiceImpl.class);
	
	//비즈니스 가입
	@Override
	public void joinBusiness(UsersDto userdto, CompanyDto companydto) throws Exception {
		companydao.joinBusiness(companydto);
		usersDao.joinBusiness(userdto);
	}
	
	//비즈니스 회원가입 중복체크
	@Override
	public void joinBusinessChk(RegisterRequest regReq) throws Exception {
		String email = usersDao.emailChk(regReq.getUemail());
		String curl = companydao.curlChk(regReq.getCurl());
		if(email!=null) {
			throw new AlreadyExistingEmailException(regReq.getUemail()+" is duplicate email.");
		}
		if(curl!=null) {
			 throw new AlreadyExistingCurlException(regReq.getCurl()+" is duplicate id.");
		}
	}
	@Override
	public String findCno(String curl) throws Exception {
		return companydao.findCno(curl);
	}
	
	//유저 가입
	@Override
	public void joinGuest(UsersDto userdto) throws Exception {
		usersDao.joinGuest(userdto);
	}
	
	//유저 회원가입 중복체크
	@Override
	public void joinGuestChk(GuestRegisterRequest regReq) throws Exception {
		String email = usersDao.emailChk(regReq.getUemail());
		String curl = companydao.curlChk(regReq.getCurl());
		if(email!=null) {
			throw new AlreadyExistingEmailException(regReq.getUemail()+" is duplicate email.");
		} 
		if(curl==null) {
			 throw new NotExistingCurlException(regReq.getCurl()+" is not duplicate url.");
		}
	}
	
	//비밀번호 확인 체크
	@Override
	public void pwdChk(UsersDto userdto) throws Exception {
		String email = usersDao.pwdChk(userdto);
		if(email==null) {
			throw new NotExistingCurlException(userdto.getUemail()+" is not duplicate email.");
		} 
	}
	//임시비밀번호 업데이트
	@Override
	public int updateTmppwd(UsersDto dto) throws Exception {
		int result = usersDao.updateTmppwd(dto);
		System.out.println(result+"행이 업데이트 되었습니다.");
		return result;
	}
	
	// 마이페이지 정보 뿌리기
	@Override
	public CompanyDto findCompany(String cno) throws Exception {
		logger.info("cno: "+companydao.findCompany(cno));
		return companydao.findCompany(cno);
	}
	@Override
	public String dnameChk(String dno) throws Exception{
		logger.info("dname: "+deptdao.dnameChk(dno));
		return deptdao.dnameChk(dno);
	}
	// 마이페이지 정보 수정
	@Override
	public int updateUrank(HashMap<String, String> paramMap) throws Exception {
		return usersDao.updateUrank(paramMap);
	}
	@Override
	public int updateUtell(HashMap<String, String> paramMap) throws Exception {
		return usersDao.updateUtell(paramMap);
	}
	@Override
	public int updateCname(HashMap<String, String> paramMap) throws Exception {
		return companydao.updateCname(paramMap);
	}
	@Override
	public int updateCtel(HashMap<String, String> paramMap) throws Exception {
		return companydao.updateCtel(paramMap);
	}
	// 마이페이지 프로필사진 변경
	@Override
	public int updateProfile(HashMap<String, String> paramMap) throws Exception{
		return usersDao.updateProfile(paramMap);
	}
	// 마이페이지 프로필사진 삭제
	@Override
	public int deleteProfile(String uno) throws Exception{
		return usersDao.deleteProfile(uno);
	}
	
	
	
	//여기부터 시큐리티
	@Override
	public void countFailure(String username) {
		usersAuthDao.updateFailureCount(username);
	}

	@Override
	public int checkFailureCount(String username) {
		return usersAuthDao.checkFailureCount(username);
	}

	@Override
	public void disabledUsername(String username) {
		usersAuthDao.updateDisabled(username);
	}

	@Override
	public void resetFailureCnt(String username) {
		usersAuthDao.updateFailureCountReset(username);
	}

	
	
	
	//채팅관련 - 혜원
	@Override
	public List<UsersDto> ChatUsersList(UsersDto dto) throws Exception {
		return usersDao.ChatUsersList(dto);
	}

	@Override
	public UsersDto ChatUserDetail(String uemail) throws Exception {
		return usersDao.ChatUserDetail(uemail);
	}
	
	// 프로젝트 유저 리스트
	@Override
	public List<UsersDto> listTaskRes(String pno) throws Exception {
		return usersDao.listTaskRes(pno);
	}
	
	//조직도 - 혜림
		public int listCountFirst() {
			return usersDao.listCountFirst();
		}
		public List<UsersDto> selectOgFirst(int startPage, int limit) { 
			return usersDao.selectOgFirst(startPage, limit);
		}
			public int listCount() {
			return usersDao.listCount();
		}
		public List<UsersDto> selectOgUser(int startPage, int limit) {
			return usersDao.selectOrgani(startPage, limit);
		}
		public int updateDept(UsersDto u) {  
			return usersDao.updateDept(u);
		}

		
	

}
