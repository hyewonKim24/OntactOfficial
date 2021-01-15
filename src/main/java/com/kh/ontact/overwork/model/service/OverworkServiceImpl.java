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
	public OverworkDto updateOverworkApp(OverworkDto o, String uno) {
		int result = overworkDao.updateOverworkApp(o, uno);
		if (result > 0) { // 읽어나온게 있다면
			o = overworkDao.selectOwOne(o.getOwno());
		} else {
			o = null; //읽어나온게 없다면
		}
		return o; 
	}

}
