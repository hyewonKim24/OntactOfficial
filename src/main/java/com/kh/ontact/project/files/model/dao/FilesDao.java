package com.kh.ontact.project.files.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("filesDao")
public class FilesDao {
	@Autowired
	private SqlSession sqlSession;
	
	public void addFile(String fname) throws Exception{
		sqlSession.insert("Files.addFile",fname);
	}
}
