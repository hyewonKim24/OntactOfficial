package com.kh.hllee.board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hllee.board.model.service.BoardReplyService;
import com.kh.hllee.board.model.service.BoardService;
import com.kh.hllee.board.model.vo.Board;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	@Autowired
	private BoardReplyService brService;
	public static final int LIMIT = 5;
	
	@RequestMapping(value = "/bList.do", method = RequestMethod.GET)
	public ModelAndView boardListService(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, 
			ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수, 페이징
			int listCount = bService.totalCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			//검색
			if (keyword != null && !keyword.equals("")) 
				mv.addObject("list", bService.selectSearch(keyword));
			else
			mv.addObject("list", bService.selectList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("board/blist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "/bJavaList.do", method = RequestMethod.GET)
	public ModelAndView boardListJavaService(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, 
			ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수, 페이징
			int listCount = bService.JavaCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			//검색
			if (keyword != null && !keyword.equals("")) 
				mv.addObject("list", bService.selectSearch(keyword));
			else
			mv.addObject("list", bService.selectJavaList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("board/bJavaList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "/bOracleList.do", method = RequestMethod.GET)
	public ModelAndView boardListOracleService(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, 
			ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수, 페이징
			int listCount = bService.OracleCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			//검색
			if (keyword != null && !keyword.equals("")) 
				mv.addObject("list", bService.selectSearch(keyword));
			else
			mv.addObject("list", bService.selectOracleList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("board/bOracleList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "/bSpringList.do", method = RequestMethod.GET)
	public ModelAndView boardListSpringService(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, 
			ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수, 페이징
			int listCount = bService.SpringCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			//검색
			if (keyword != null && !keyword.equals("")) 
				mv.addObject("list", bService.selectSearch(keyword));
			else
			mv.addObject("list", bService.selectSpringList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("board/bSpringList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	

	@RequestMapping(value = "/bDetail.do", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam(name = "board_num") String board_num,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			mv.addObject("board", bService.selectBoard(0, board_num));
			mv.addObject("commentList", brService.selectList(board_num));
			mv.addObject("currentPage", currentPage);
			mv.setViewName("board/boardDetail");
			

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "/bRenew.do", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam(name = "board_num") String board_num, ModelAndView mv) {
		try {
			mv.addObject("board", bService.selectBoard(1, board_num));
			mv.setViewName("board/boardRenew");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "/writeForm.do", method = RequestMethod.GET)
	public String boardInsertForm(ModelAndView mv) {
		return "board/writeForm";
	}

	@RequestMapping(value = "/bInsert.do", method = RequestMethod.POST)
	public ModelAndView boardInsert(Board b, 
			@RequestParam(name = "upfile", required = false) MultipartFile report,
//			@RequestParam(name = "boardType") int board_type,
			HttpServletRequest request, ModelAndView mv) {
		
			//전환시켜주는 코드
			if (report != null && !report.equals(""))
				saveFile(report, request);
			b.setBoard_file(report.getOriginalFilename());
			bService.insertBoard(b);
			mv.setViewName("redirect:bList.do");
			
		return mv;
	}

	@RequestMapping(value = "/bUpdate.do", method = RequestMethod.POST)
	public ModelAndView boardUpdate(Board b, @RequestParam(name = "page", defaultValue = "1") int page,
	@RequestParam(name = "upfile") MultipartFile report, HttpServletRequest request, ModelAndView mv) {
		try {
			//첨부파일 저장
			if (report != null && !report.equals("")) {
				removeFile(b.getBoard_file(),request); // 기존에 있던 파일이 있다면 삭제해줘라
				saveFile(report, request); 
				b.setBoard_file(report.getOriginalFilename()); 
			}
			if(bService.updateBoard(b) != null) {
				mv.addObject("board_num", bService.updateBoard(b).getBoard_num()); //가지고 들어가는 것
				mv.setViewName("redirect:bDetail.do"); 
				mv.addObject("currentPage", page); //가지고 들어가는 것
			} else {
				//이전화면으로 이동
			}
				
		} catch (Exception e) {  
			System.out.println("transaction 실패"); 
//			mv.addObject("msg", e.getMessage()); 
//			mv.setViewName("errorPage");
		}
			return mv; 
		}

	@RequestMapping(value = "/bDelete.do", method = RequestMethod.GET)
	public ModelAndView boardDelete(@RequestParam(name = "board_num") String board_num,
			@RequestParam(name = "page", defaultValue = "1") int page, HttpServletRequest request, ModelAndView mv) {
		try {
			Board b = bService.selectBoard(1, board_num);
			removeFile(b.getBoard_file(), request);
			bService.deleteBoard(board_num);
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:bList.do");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 생성한다.
		}
		String filePath = null;
		try {
			// 파일 저장
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);
			filePath = folder + "/" + report.getOriginalFilename();
			report.transferTo(new File(filePath)); // 파일을 저장한다 
			System.out.println("파일 명 : " + report.getOriginalFilename()); 
			System.out.println("파일 경로 : " + filePath); System.out.println("파일 전송이 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
	}

	private void removeFile(String board_file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/uploadFiles";
		String filePath = savePath + "/" + board_file;
		try { 
			System.out.println(board_file + "을 삭제합니다.");
			System.out.println("기존 저장 경로 : " + savePath);
			File delFile = new File(filePath); //filePath의 주소를 delFile에 넣어준
			delFile.delete(); // 파일을 지운다
			System.out.println("파일 삭제가 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 삭제 에러 : " + e.getMessage()); 
			//geMessage는 마지막에 에러난 멧세지만 보여준다 
		}
	}
}
