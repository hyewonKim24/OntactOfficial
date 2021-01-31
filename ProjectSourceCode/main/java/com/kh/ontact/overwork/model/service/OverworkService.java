package com.kh.ontact.overwork.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.ontact.overwork.model.dto.OverworkDto;

public interface OverworkService {
	
	public int listCount(String uno);
	
	public List<OverworkDto> selectOverwork(int startPage, int limit, String uno);
	
	public int searchlistCount(HashMap<String, String> paramMap) throws Exception;
	
	public List<OverworkDto> searchOverwork(int startPage, int limit, HashMap<String, String> paramMap); 

	public OverworkDto selectOwOne(String owno);
	
	public int insertOverwork(OverworkDto o); 
	
	public int updateOverworkApp(String owno); 
}
