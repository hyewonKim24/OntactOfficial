package com.kh.ontact.dept.model.service;

import java.util.List;

import com.kh.ontact.dept.model.dao.DeptDao;
import com.kh.ontact.dept.model.dto.DeptDto;

public interface DeptService {
	//윤진 - 프로젝트
	public List<DeptDto> selectListDept(String cno);
	
	//혜림 - 조직도
	public int listCount();
	
	public List<DeptDto> selectDept();

	public List<DeptDto> searchDept(String keyword);  
	
	public DeptDto selectDtOne(String dno);

	public int insertDept(DeptDto d);
	
	public int deleteDept(String dno); 
	
}
