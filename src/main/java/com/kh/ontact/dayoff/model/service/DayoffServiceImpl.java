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
	public int allListCount(String uno) {
		return dayoffDao.allListCount(uno);
	}

	@Override
	public List<DayoffDto> selectDayoff(int startPage, int limit, String uno) {
		return dayoffDao.selectDayoff(startPage, limit, uno);
	}
	@Override
	public int listCount(HashMap<String, String> paramMap) {
		return dayoffDao.listCount(paramMap);
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
	public int updateDayoffApp(String dfno) {
		System.out.println("서비스에서" + dfno);
		return dayoffDao.updateDayoffApp(dfno);
	}
	
	@Override
	public List<DayoffDto> selectDfCalendar(HashMap<String, String> paramMap) {
		return dayoffDao.selectDfCalendar(paramMap);
	}

}
