package com.kh.ontact.dayoff.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.dayoff.model.dao.DayoffDao;
import com.kh.ontact.dayoff.model.dto.DayoffDto;

@Service("dayoffServ")
public class DayoffServiceImpl implements DayoffService{
	
	@Autowired
	private DayoffDao dayoffDao;
	
	@Override
	public int allListCount() {
		return dayoffDao.allListCount();
	}

	@Override
	public List<DayoffDto> selectDayoff(int startPage, int limit) {
		return dayoffDao.selectDayoff(startPage, limit);
	}
	@Override
	public List<DayoffDto> searchDayoff(HashMap<String, String> paramMap) {
		return dayoffDao.searchDayoff(paramMap);
	}
	
	@Override
	public DayoffDto selectDfOne(String dfno) {
		return dayoffDao.selectDfOne(dfno);
	}

	@Override
	public int insertDayoff(DayoffDto d) {
		System.out.println("서비스진");
		return dayoffDao.insertDayoff(d);
	}

	@Override
	public DayoffDto updateDayoffApp(DayoffDto d) {
		int result = dayoffDao.updateDayoffApp(d);
		if (result > 0) { // 읽어나온게 있다면
			d = dayoffDao.selectDfOne(d.getDfno());
		} else {
			d = null; //읽어나온게 없다면
		}
		return d;
	}

}
