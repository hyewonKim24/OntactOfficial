package com.kh.ontact.alert.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.alert.model.dao.AlertDao;
import com.kh.ontact.alert.model.dto.AlertDto;
import com.kh.ontact.users.model.dto.UsersDto;

@Service("alertService")
public class AlertServiceImpl implements AlertService {
	@Autowired
	private AlertDao alertDao;
	
	@Override
	public int alertInsert(AlertDto dto) throws Exception {
		return alertDao.alertInsert(dto);
	}
	@Override
	public int deleteAll(int bno) throws Exception {
		return alertDao.deleteAll(bno);
	}
	@Override
	public int alertCount(String uno) throws Exception {
		return alertDao.alertCount(uno);
	}
	@Override
	public List<AlertDto> alertNotList(String uno) throws Exception {
		return alertDao.alertNotList(uno);
	}
	@Override
	public List<AlertDto> alertAllList(String uno) throws Exception {
		return alertDao.alertAllList(uno);
	}
	@Override
	public List<AlertDto> alertAllRead(String uno) throws Exception {
		int rs= alertDao.alertAllRead(uno);
		System.out.println("알림 전체 읽음:"+rs);
		return alertDao.alertNotList(uno);
	}
	@Override
	public List<AlertDto> alertallreadtab2(String uno) throws Exception {
		int rs= alertDao.alertAllRead(uno);
		System.out.println("알림 전체 읽음:"+rs);
		return alertDao.alertAllList(uno);
	}
	@Override
	public int alertProRead(AlertDto dto) throws Exception {
		return alertDao.alertProRead(dto);
	}
	@Override
	public int alertBoardRead(AlertDto dto) throws Exception {
		return alertDao.alertBoardRead(dto);
	}

}
