package com.kh.ontact.project.files.controller;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ontact.commons.util.UploadFileUtils;
import com.kh.ontact.users.controller.UsersMainController;

@RestController
@RequestMapping(value="/files")
public class FilesController {
	
	private static final Logger logger = LoggerFactory.getLogger(FilesController.class);

	// 게시글 입력 전) 첨부파일 서버에 저장하는 메소드
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadFile(MultipartFile file, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		try {
			// 파일 업로드 수행, /년/월/일/UUID_파일명 문자열 리턴함
			String savedFilePath = UploadFileUtils.uploadFile(file, request);
			// uploadFile() 로 리턴 받은 문자열을 호출한 클라이언트 화면으로 리턴함
			entity = new ResponseEntity<>(savedFilePath, HttpStatus.CREATED);
			logger.info("들어옴"+savedFilePath);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			logger.error(e.toString());
		}
		return entity;
	}

	// 첨부파일 출력 메서드(업로드한 첨부파일 확인)
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception {

		HttpHeaders httpHeaders = UploadFileUtils.getHttpHeaders(fileName); // Http 헤더 설정 가져오기, 파일타입 판별+클라리언트에게
																			// httpHeaders객체 리턴
		String rootPath = UploadFileUtils.getRootPath(fileName, request); // 업로드 기본경로 경로

		ResponseEntity<byte[]> entity = null;

		// 파일데이터, HttpHeader 클라이언트 화면으로 전송
		try (InputStream inputStream = new FileInputStream(rootPath + fileName)) {
			entity = new ResponseEntity<>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 게시글 파일 삭제 : 게시글 작성 페이지
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		try {
			UploadFileUtils.deleteFile(fileName, request);
			//deleteFile()은 이미지 타입 여부를 판별함. 이미지 파일일 경우 원본 이미지 삭제/썸네일 삭제, 일반파일일 경우 파일 삭제처리
			entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
