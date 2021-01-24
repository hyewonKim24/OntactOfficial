package com.kh.ontact.dept.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.dept.model.dao.DeptDao;
import com.kh.ontact.dept.model.dto.DeptDto;
import com.kh.ontact.users.model.dto.UsersDto;

@Service("deptServ")
public class DeptServiceImpl implements DeptService{
	@Autowired
	private DeptDao deptDao;
	
	//윤진 - 프로젝트
	public List<DeptDto> selectListDept(String cno){
		return deptDao.selectListDept(cno);
	}
	
	//혜림- 조직도
	@Override
	public int listCount(String cno) {
		return deptDao.listCount(cno);
	}
	
	@Override
	public List<DeptDto> selectDept(String cno) {
		return deptDao.selectDept(cno);
	}
	
	@Override
	public int searchlistCount() {
		return deptDao.searchlistCount();
	}
	
	@Override
	public List<DeptDto> searchDept(String keyword) {  
		return deptDao.searchDept(keyword);
	}
	
	@Override
	public int insertDept(DeptDto d) {  
		return deptDao.insertDept(d);
	}
	
	@Override
	public int deleteDept(HashMap<String, String> paramMap2) {  
		
		
		System.out.println("결과갑 ㅅ : " + paramMap2.get("dno"));
		System.out.println("결과갑 ㅅ : " + paramMap2.get("cno"));
		int rs = deptDao.deleteDept(paramMap2);
		System.out.println("결과갑 ㅅ : " + rs);
		return rs;
		
	}
	
	@Override
	public DeptDto selectDtOne(String dno){
		return deptDao.selectDtOne(dno);
		
	}
	
	public int updateDept(List<UsersDto> list) { 
		int rs = 0;
		for(int i = 0; i < list.size(); i++) {
			 rs += deptDao.updateDept(list.get(i));
		}
		System.out.println(rs + "행이 업데이트됨");
		return rs;
	}
	
}