package com.kh.ontact.project.files.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("filesDao")
public class FilesDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int addFile(HashMap<String, String> paramMap) throws Exception{
		return sqlSession.insert("Files.addFile",paramMap);
	}
}
