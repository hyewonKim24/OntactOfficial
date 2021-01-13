package com.kh.ontact.project.commonboard.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.commonboard.model.dao.CommonboardDao;
import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.files.model.dao.FilesDao;

@Service("commonboardService")
public class CommonboardServiceImpl implements CommonboardService{
	@Autowired
	CommonboardDao commonboardDao;
	@Autowired
	FilesDao filesdao;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonboardServiceImpl.class);
	
	@Override
	public void insertCommonboard(CommonboardDto dto) throws Exception{
		commonboardDao.insertCommonboard(dto);
		String[] files = dto.getFiles();
		
		if(files==null)
			return;
		for(String fname : files)
			filesdao.addFile(fname);
	}
	
}
