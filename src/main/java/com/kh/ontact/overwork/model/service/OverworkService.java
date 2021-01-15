package com.kh.ontact.overwork.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.ontact.overwork.model.dto.OverworkDto;

public interface OverworkService {
	
	public int listCount();
	
	public List<OverworkDto> selectOverwork(int startPage, int limit, String uno);
	
	public List<OverworkDto> searchOverwork(HashMap<String, String> paramMap); 

	public OverworkDto selectOwOne(String owno);
	
	public int insertOverwork(OverworkDto o); 
	
	public OverworkDto updateOverworkApp(OverworkDto o, String uno); 
}
