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
	public int allListCount() {
		return commuteDao.allListCount();
	}

	@Override
	public List<CommuteDto> selectDailyCommute(int startPage, int limit) {
		return commuteDao.selectDailyCommute(startPage, limit);
	}

	@Override
	public int listCount() {
		return commuteDao.listCount();
	}

	@Override
	public List<CommuteDto> searchDailyCommute(HashMap<String, String> paramMap) {
		return commuteDao.searchDailyCommute(paramMap);
	}

	@Override
	public int monthListCount() {
		return commuteDao.monthListCount();
	}

	@Override
	public List<CommuteDto> searchMonthCommute(HashMap<String, String> paramMap) {
		return commuteDao.searchMonthCommute(paramMap);
	}

	@Override
	public int insertEnter(CommuteDto c) {
		return commuteDao.insertEnter(c);
	}

	@Override
	public int updateLeave(CommuteDto c) {
		return commuteDao.updateLeave(c);
	}
}
