package com.kh.ontact.users.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.company.model.dao.CompanyDao;
import com.kh.ontact.company.model.dto.CompanyDto;
import com.kh.ontact.users.model.dao.UsersAuthDao;
import com.kh.ontact.users.model.dao.UsersDao;
import com.kh.ontact.users.model.dto.UsersDto;

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
	
	//이메일 중복체크
	@Override
	public int emailChk(String uemail) throws Exception {
		int result = usersDao.emailChk(uemail);
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

}
