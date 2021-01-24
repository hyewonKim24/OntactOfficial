package com.kh.ontact.overwork.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.overwork.model.dao.OverworkDao;
import com.kh.ontact.overwork.model.dto.OverworkDto;

@Service("overworkServ")
public class OverworkServiceImpl implements OverworkService{
	@Autowired
	private OverworkDao overworkDao;

	@Override
	public int listCount(String uno) {
		return overworkDao.listCount(uno);
	}

	@Override
	public List<OverworkDto> selectOverwork(int startPage, int limit, String uno) {
		return overworkDao.selectOverwork(startPage, limit, uno);
	}
	
	@Override
	public int searchlistCount(HashMap<String, String> paramMap) throws Exception {
		return overworkDao.searchlistCount(paramMap);
	} 
	
	@Override
	public List<OverworkDto> searchOverwork(HashMap<String, String> paramMap){
		return overworkDao.searchOverwork(paramMap);
	}
	
	@Override
	public OverworkDto selectOwOne(String owno){
		return overworkDao.selectOwOne(owno);
	}
	
	@Override
	public int insertOverwork(OverworkDto o) {
		return overworkDao.insetOverwork(o);
	}

	@Override
	public int updateOverworkApp(String owno) {
		
		return overworkDao.updateOverworkApp(owno); 
	}

}
