package com.kh.ontact.company.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.company.model.dto.CompanyDto;

@Repository("companyDao")
public class CompanyDao {
	@Autowired
	private SqlSession sqlSession;
	
	//ȸ�� ȸ������
	public void joinBusiness(CompanyDto dto) throws Exception{
		sqlSession.insert("Company.joinBusiness",dto);
	}
	
	
	/* 혜원 코드 */
	//회사명 가져오기
	public String cnameOne(String cno) throws Exception {
		return sqlSession.selectOne("Company.cnameOne", cno);
	}
}
