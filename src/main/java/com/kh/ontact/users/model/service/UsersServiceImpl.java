package com.kh.ontact.users.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.company.model.dao.CompanyDao;
import com.kh.ontact.company.model.dto.CompanyDto;
import com.kh.ontact.users.exception.AlreadyExistingCurlException;
import com.kh.ontact.users.exception.AlreadyExistingEmailException;
import com.kh.ontact.users.exception.NotExistingCurlException;
import com.kh.ontact.users.model.dao.UsersAuthDao;
import com.kh.ontact.users.model.dao.UsersDao;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.util.GuestRegisterRequest;
import com.kh.ontact.users.util.PwdRegisterRequest;
import com.kh.ontact.users.util.RegisterRequest;

@Service("usersService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	UsersDao usersDao;
	@Autowired
	CompanyDao companydao;
	@Autowired
	UsersAuthDao usersAuthDao;

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
	

}
