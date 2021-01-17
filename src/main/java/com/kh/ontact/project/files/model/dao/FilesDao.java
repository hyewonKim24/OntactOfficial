package com.kh.ontact.project.files.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.files.model.dto.FilesDto;

@Repository("filesDao")
public class FilesDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 파일 리스트 뿌리기
	public List<FilesDto> getFileboard(String pno) throws Exception{
		return sqlSession.selectList("Files.getFileboard", pno);
	}
	
	// 글 인서트시 파일 인서트
	public int addFile(HashMap<String, String> paramMap) throws Exception{
		return sqlSession.insert("Files.addFile",paramMap);
	}
	
	// 글 삭제시 전체 파일 삭제
	public int deleteFiles(String bno) throws Exception{
		return sqlSession.delete("Files.deleteFiles",bno);
	}
	
	// 글 수정시 개별 파일 삭제
	public void deleteFile(String fname) throws Exception{
		sqlSession.delete("Files.getFileboard", fname);
	}
	
	// 글 수정시 파일 추가
	public void replaceFile(HashMap<String, String> paramMap) throws Exception{
		sqlSession.insert("Files.getFileboard", paramMap);
	}
	
	
	// 여기부터 파일메뉴
	// 전체프로젝트 불러오기
	public List<FilesDto> filelist() throws Exception{
		return sqlSession.selectList("Files.filelist");
	}
	// 파일명 오름차순
	public List<FilesDto> fnameasc() throws Exception{
		return sqlSession.selectList("Files.fnameasc");
	}
	
	
	
	
	// 프로젝트별 불러오기
	public List<FilesDto> filelistpj(String pno) throws Exception{
		return sqlSession.selectList("Files.filelist",pno);
	}
}
