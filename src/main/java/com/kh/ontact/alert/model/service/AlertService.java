package com.kh.ontact.alert.model.service;

import java.util.List;

import com.kh.ontact.alert.model.dto.AlertDto;

public interface AlertService {
	
	int alertInsert(AlertDto dto) throws Exception ;
	
	int deleteAll(int bno) throws Exception;
	
	int alertCount(String uno) throws Exception;
	
	List<AlertDto> alertNotList(String uno) throws Exception ;
	
	List<AlertDto> alertAllList(String uno) throws Exception ;
	
	List<AlertDto> alertAllRead(String uno) throws Exception;

}
