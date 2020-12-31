package com.kh.ontact.company.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.company.model.dto.CompanyDto;

@Repository("companyDao")
public class CompanyDao {
	@Autowired
	private SqlSession sqlSession;
	
	//회사 회원가입
	public void joinBusiness(CompanyDto dto) throws Exception{
		sqlSession.insert("Company.joinBusiness",dto);
	}
}
