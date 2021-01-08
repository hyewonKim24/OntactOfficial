package com.kh.ontact.dept.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.dept.model.dao.DeptDao;
import com.kh.ontact.dept.model.dto.DeptDto;

@Service("deptServ")
public class DeptServiceImpl implements DeptService{
	@Autowired
	private DeptDao deptDao;
	
	public List<DeptDto> selectListDeptDname(){
		return deptDao.selectListDeptDname();
	}
}
