package com.kh.ontact.chatalert.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.chatalert.model.dao.ChatAlertDao;
import com.kh.ontact.chatalert.model.dto.ChatAlertDto;

@Service("chatalertService")
public class ChatAlertServiceImpl implements ChatAlertService{
	@Autowired
	private ChatAlertDao chatalertDao;
	
	@Override
	public int insertChatAlert(ChatAlertDto dto) throws Exception {
		return chatalertDao.insertChatAlert(dto);
	}

	@Override
	public int updateChatAlertPlus(ChatAlertDto dto) throws Exception {
		return chatalertDao.updateChatAlertPlus(dto);
	}

	@Override
	public int updateChatAlertReset(ChatAlertDto dto) throws Exception {
		return chatalertDao.updateChatAlertReset(dto);
	}

	@Override
	public int EachChatAlert(ChatAlertDto dto) throws Exception {
		return chatalertDao.EachChatAlert(dto);
	}

	@Override
	public int AllChatAlert(String uno) throws Exception {
		return chatalertDao.AllChatAlert(uno);
	}

	@Override
	public int insertChatAlertDefault(ChatAlertDto dto) throws Exception {
		return chatalertDao.insertChatAlertDefault(dto);
	}

}
