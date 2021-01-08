package com.kh.ontact.chatalert.model.service;

import com.kh.ontact.chatalert.model.dto.ChatAlertDto;

public interface ChatAlertService {

	public int insertChatAlert(ChatAlertDto dto) throws Exception;
	public int insertChatAlertDefault(ChatAlertDto dto) throws Exception;
	public int updateChatAlertPlus(ChatAlertDto dto) throws Exception;
	public int updateChatAlertReset(ChatAlertDto dto) throws Exception;
	public String EachChatAlert(ChatAlertDto dto) throws Exception;
	public String AllChatAlert(String uno) throws Exception;
	
}
