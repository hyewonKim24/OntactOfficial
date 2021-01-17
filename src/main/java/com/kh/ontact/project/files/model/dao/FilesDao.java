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
	public List<FilesDto> getFileboard(String pno) throws Exception {
		return sqlSession.selectList("Files.getFileboard", pno);
	}

	// 글 인서트시 파일 인서트
	public int addFile(HashMap<String, String> paramMap) throws Exception {
		return sqlSession.insert("Files.addFile", paramMap);
	}

	// 글 삭제시 전체 파일 삭제
	public int deleteFiles(int bno) throws Exception {
		return sqlSession.delete("Files.deleteFiles", bno);
	}

	// 글 수정시 개별 파일 삭제
	public void deleteFile(String fname) throws Exception {
		sqlSession.delete("Files.getFileboard", fname);
	}

	// 글 수정시 파일 추가
	public void replaceFile(HashMap<String, String> paramMap) throws Exception {
		sqlSession.insert("Files.getFileboard", paramMap);
	}
	
	
	
	

	// 여기부터 파일메뉴
	// 전체프로젝트 불러오기
	public List<FilesDto> filelist() throws Exception {
		return sqlSession.selectList("Files.filelist");
	}

	// 파일명 내림차순
	public List<FilesDto> fnamedesc() throws Exception {
		return sqlSession.selectList("Files.fnamedesc");
	}

	// 파일명 오름차순
	public List<FilesDto> fnameasc() throws Exception {
		return sqlSession.selectList("Files.fnameasc");
	}

	// 크기 내림차순
	public List<FilesDto> fsizedesc() throws Exception {
		return sqlSession.selectList("Files.fsizedesc");
	}

	// 크기 오름차순
	public List<FilesDto> fsizeasc() throws Exception {
		return sqlSession.selectList("Files.fsizeasc");
	}

	// 등록자 내림차순
	public List<FilesDto> unamedesc() throws Exception {
		return sqlSession.selectList("Files.unamedesc");
	}

	// 등록자 오름차순
	public List<FilesDto> unameasc() throws Exception {
		return sqlSession.selectList("Files.fsizeasc");
	}

	// 최근 업로드순 내림차순
	public List<FilesDto> fdatedesc() throws Exception {
		return sqlSession.selectList("Files.fdatedesc");
	}

	// 최근 업로드순 오름차순
	public List<FilesDto> fdateasc() throws Exception {
		return sqlSession.selectList("Files.fdateasc");
	}

	
	
	
	
	// ********프로젝트별 불러오기********* ㅠㅠ
	public List<FilesDto> pjfilelist(String pno) throws Exception {
		return sqlSession.selectList("Files.pjfilelist", pno);
	}

	// 파일명 내림차순
	public List<FilesDto> pjfnamedesc(String pno) throws Exception {
		return sqlSession.selectList("Files.pjfnamedesc", pno);
	}

	// 파일명 오름차순
	public List<FilesDto> pjfnameasc(String pno) throws Exception {
		return sqlSession.selectList("Files.pjfnameasc", pno);
	}

	// 크기 내림차순
	public List<FilesDto> pjfsizedesc(String pno) throws Exception {
		return sqlSession.selectList("Files.pjfsizedesc", pno);
	}

	// 크기 오름차순
	public List<FilesDto> pjfsizeasc(String pno) throws Exception {
		return sqlSession.selectList("Files.pjfsizeasc", pno);
	}

	// 등록자 내림차순
	public List<FilesDto> pjunamedesc(String pno) throws Exception {
		return sqlSession.selectList("Files.pjunamedesc", pno);
	}

	// 등록자 오름차순
	public List<FilesDto> pjunameasc(String pno) throws Exception {
		return sqlSession.selectList("Files.pjfsizeasc", pno);
	}

	// 최근 업로드순 내림차순
	public List<FilesDto> pjfdatedesc(String pno) throws Exception {
		return sqlSession.selectList("Files.pjfdatedesc", pno);
	}

	// 최근 업로드순 오름차순
	public List<FilesDto> pjfdateasc(String pno) throws Exception {
		return sqlSession.selectList("Files.pjfdateasc", pno);
	}
}
