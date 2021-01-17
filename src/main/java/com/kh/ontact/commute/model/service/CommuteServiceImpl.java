package com.kh.ontact.commute.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.commute.model.dao.CommuteDao;
import com.kh.ontact.commute.model.dto.CommuteDto;

@Service("commuteServ")
public class CommuteServiceImpl implements CommuteService {
	@Autowired
	private CommuteDao commuteDao;

	@Override
	public int allListCount(String uno) {
		return commuteDao.allListCount(uno);
	}

	@Override
	public List<CommuteDto> selectDailyCommute(int startPage, int limit, String uno) {
		return commuteDao.selectDailyCommute(startPage, limit, uno);
	}

	@Override
	public int listCount(HashMap<String, String> paramMap) {
		return commuteDao.listCount(paramMap);
	}

	@Override
	public List<CommuteDto> searchDailyCommute(HashMap<String, String> paramMap) {
		return commuteDao.searchDailyCommute(paramMap);
	}
	@Override
	public int insertEnter(CommuteDto c) {
		return commuteDao.insertEnter(c);
	}
	
	@Override
	public int updateLeave(CommuteDto c) {
		return commuteDao.updateLeave(c);
	}

	//월 근무내역
	
	@Override
	public int mAllCount(String uno) {
		return commuteDao.mAllCount(uno);
	}

	@Override
	public List<CommuteDto> selectMonthCommute(int startPage, int limit, String uno) {
		return commuteDao.selectMonthCommute(startPage, limit, uno);
	}

	
	@Override
	public int msearchCount() {
		return commuteDao.msearchCount();
	}

	@Override
	public List<CommuteDto> searchMonthCommute(HashMap<String, String> paramMap) {
		return commuteDao.searchMonthCommute(paramMap);
	}
	
	@Override
	public List<CommuteDto> testCommute(String uno) {
		return commuteDao.testCommute(uno);
	}

}
