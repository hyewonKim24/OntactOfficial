package com.kh.ontact.company.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.company.model.dto.CompanyDto;

@Repository("companyDao")
public class CompanyDao {
	@Autowired
	private SqlSession sqlSession;

	// 비즈니스 회원가입
	public void joinBusiness(CompanyDto dto) throws Exception {
		sqlSession.insert("Company.joinBusiness", dto);
	}

	// 회사 url 중복체크
	public String curlChk(String curl) throws Exception {
		return sqlSession.selectOne("Company.curlChk", curl);
	}

	// 유저 가입 회사 cno 찾기
	public String findCno(String curl) throws Exception {
		return sqlSession.selectOne("Company.findCno", curl);
	}
	
	// 마이페이지 - 회사 정보 가져오기
	public CompanyDto findCompany(String cno) throws Exception{
		return sqlSession.selectOne("Company.findCompany", cno);
	}
	// 마이페이지 - 내정보 수정
	public int updateCname(HashMap<String, String> paramMap) throws Exception{
		return sqlSession.update("Company.updateCname",paramMap);
	}
	public int updateCtel(HashMap<String, String> paramMap) throws Exception{
		return sqlSession.update("Company.updateCtel",paramMap);
	}
	

	/* 혜원 코드 */
	// 회사명 가져오기
	public String cnameOne(String cno) throws Exception {
		return sqlSession.selectOne("Company.cnameOne", cno);
	}
}
