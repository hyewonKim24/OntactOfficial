package com.kh.ontact.company.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.company.model.dao.CompanyDao;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	CompanyDao companydao;

	@Override
	public String SelectCEO(String cno) throws Exception {
		return companydao.SelectCEO(cno);
	}
	
	//@Override
//	public String findCno(String curl) throws Exception {
//		return companydao.findCno(curl);
//	}

}
