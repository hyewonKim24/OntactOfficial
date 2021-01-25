package com.kh.ontact.dept.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.ontact.dept.model.dto.DeptDto;
import com.kh.ontact.users.model.dto.UsersDto;

public interface DeptService {
	//윤진 - 프로젝트
	public List<DeptDto> selectListDept(String cno);
	
	//혜림 - 조직도
	public int listCount(String cno);
	
	public List<DeptDto> selectDept(String cno);

	public int searchlistCount();
	
	public List<DeptDto> searchDept(String keyword);  
	
	public DeptDto selectDtOne(String dno);

	public int insertDept(DeptDto d);
	
	public int deleteDept(HashMap<String, String> paramMap2); 
	
	public int updateDept(List<UsersDto> list);
	
	public String selectDeptPno(DeptDto dto) throws Exception;
	
}