package com.kh.ontact.project.files.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.files.model.dao.FilesDao;

@Service("filesService")
public class FilesServiceImpl implements FilesService{
	@Autowired
	FilesDao filesDao;
	
	@Override
	public int deleteFile(String[] fname) throws Exception {
		int result = 0;
		for (int i = 0; i < fname.length; i++) {
			String eachfname = fname[i];
			result += filesDao.deleteFile(eachfname);
		}
		System.out.println(result+"행이 삭제되었습니다.");
		return result;
	}
}
