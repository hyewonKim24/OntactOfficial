package com.kh.ontact.users.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.ontact.company.model.dao.CompanyDao;
import com.kh.ontact.company.model.dto.CompanyDto;
import com.kh.ontact.users.model.dao.UsersDao;
import com.kh.ontact.users.model.dto.UsersDto;

@Service("usersService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	UsersDao usersdao;
	@Autowired
	CompanyDao companydao;

	//비즈니스 회원가입
	@Override
	public void joinBusiness(UsersDto userdto, CompanyDto companydto) throws Exception {
		companydao.joinBusiness(companydto);
		usersdao.joinBusiness(userdto);
		
	}
	
	//아이디 중복체크
	@Override
	public int emailChk(String uemail) throws Exception {
		int result = usersdao.emailChk(uemail);
		return result;
	}

}
