package com.kh.ontact.project.files.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ontact.commons.util.MediaUtils;
import com.kh.ontact.commons.util.UploadFileUtils;
import com.kh.ontact.project.files.model.dao.FilesDao;
import com.kh.ontact.project.files.model.dto.FilesDto;
import com.kh.ontact.project.model.service.ProjectService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@RestController
@RequestMapping(value = "/files")
public class FilesController {
	@Autowired
	FilesDao filesDao;
	@Autowired
	private ProjectService pjService;

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
			logger.info("들어옴" + savedFilePath);
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
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ResponseEntity<byte[]> download(String fileName, HttpServletRequest request) throws Exception {
		HttpHeaders httpHeaders = UploadFileUtils.downHttpHeaders(fileName); // Http 헤더 설정 가져오기, 파일타입 판별+클라리언트에게
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
			// deleteFile()은 이미지 타입 여부를 판별함. 이미지 파일일 경우 원본 이미지 삭제/썸네일 삭제, 일반파일일 경우 파일 삭제처리
			entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 게시글 파일 전체 삭제
	@RequestMapping(value = "/deleteAll", method = RequestMethod.POST)
	public ResponseEntity<String> deleteAllFiles(@RequestParam("files[]") String[] files, HttpServletRequest request) {

		if (files == null || files.length == 0)
			return new ResponseEntity<>("DELETED", HttpStatus.OK);

		ResponseEntity<String> entity = null;

		try {
			for (String fileName : files)
				UploadFileUtils.deleteFile(fileName, request);
			entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	
//*****파일리스트******
	// 여기부터 파일메뉴
	// 메인화면 이동
	@RequestMapping("/list")
	public ModelAndView getFileList() {
		ModelAndView mv = new ModelAndView();
		MediaUtils util = new MediaUtils();
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String uno = user.getUno();
		System.out.println(uno);
		try {
			List<FilesDto> list = filesDao.filelist();
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
			mv.addObject("listpj", pjService.selectListProject(uno));
			System.out.println(pjService.selectListProject(uno));
			mv.addObject("flist", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("project/files");
		return mv;
	}
	
	// 파일명 오름차순
	@ResponseBody
	@RequestMapping("/fnameasc")
	public List<FilesDto> fnameasc() {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.fnameasc();
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 파일명 내림차순
	@ResponseBody
	@RequestMapping("/fnamedesc")
	public List<FilesDto> fnamedesc() {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.fnamedesc();
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 파일 사이즈 오름차순
	@ResponseBody
	@RequestMapping("/fsizeasc")
	public List<FilesDto> fsizeasc() {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.fsizeasc();
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 파일 사이즈 내림차순
	@ResponseBody
	@RequestMapping("/fsizedesc")
	public List<FilesDto> fsizedesc() {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.fsizedesc();
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 작성자 오름차순
	@ResponseBody
	@RequestMapping("/unameasc")
	public List<FilesDto> unameasc() {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.unameasc();
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 작성자 내림차순
	@ResponseBody
	@RequestMapping("/unamedesc")
	public List<FilesDto> unamedesc() {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.unamedesc();
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 최근 업로드순 오름차순
	@ResponseBody
	@RequestMapping("/fdateasc")
	public List<FilesDto> fdateasc() {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.fdateasc();
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 최근 업로드순 내림차순
	@ResponseBody
	@RequestMapping("/fdatedesc")
	public List<FilesDto> fdatedesc() {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.fdatedesc();
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
//*****프로젝트별 파일리스트******
	@RequestMapping(value="/pjlist", method = RequestMethod.POST)
	public ModelAndView filelistpj(@RequestParam String pno) {
		ModelAndView mv = new ModelAndView();
		MediaUtils util = new MediaUtils();
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String uno = user.getUno();
		try {
			List<FilesDto> list = filesDao.pjfilelist(pno);
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
			mv.addObject("listpj", pjService.selectListProject(uno));
			mv.addObject("flist", list);
			mv.addObject("pno", pno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("project/filespj");
		return mv;
	}
	
	// 파일명 오름차순
	@ResponseBody
	@RequestMapping("/pjfnameasc")
	public List<FilesDto> pjfnameasc(@RequestParam String pno) {
		System.out.println(pno);
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.pjfnameasc(pno);
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 파일명 내림차순
	@ResponseBody
	@RequestMapping("/pjfnamedesc")
	public List<FilesDto> pjfnamedesc(@RequestParam String pno) {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.pjfnamedesc(pno);
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 파일 사이즈 오름차순
	@ResponseBody
	@RequestMapping("/pjfsizeasc")
	public List<FilesDto> pjfsizeasc(@RequestParam String pno) {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.pjfsizeasc(pno);
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 파일 사이즈 내림차순
	@ResponseBody
	@RequestMapping("/pjfsizedesc")
	public List<FilesDto> pjfsizedesc(@RequestParam String pno) {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.pjfsizedesc(pno);
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 작성자 오름차순
	@ResponseBody
	@RequestMapping("/pjunameasc")
	public List<FilesDto> pjunameasc(@RequestParam String pno) {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.pjunameasc(pno);
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 작성자 내림차순
	@ResponseBody
	@RequestMapping("/pjunamedesc")
	public List<FilesDto> pjunamedesc(@RequestParam String pno) {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.pjunamedesc(pno);
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 최근 업로드순 오름차순
	@ResponseBody
	@RequestMapping("/pjfdateasc")
	public List<FilesDto> pjfdateasc(@RequestParam String pno) {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.pjfdateasc(pno);
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 최근 업로드순 내림차순
	@ResponseBody
	@RequestMapping("/pjfdatedesc")
	public List<FilesDto> pjfdatedesc(@RequestParam String pno) {
		MediaUtils util = new MediaUtils();
		List<FilesDto> list = null;
		try {
			list = filesDao.pjfdatedesc(pno);
			for (int i = 0; i < list.size(); i++) {
				String fsize = list.get(i).getFsize();
				list.get(i).setFsize(util.getFileSize(fsize));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
