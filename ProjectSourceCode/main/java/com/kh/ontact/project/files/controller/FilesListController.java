package com.kh.ontact.project.files.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.ontact.commons.util.MediaUtils;
import com.kh.ontact.project.files.model.dao.FilesDao;
import com.kh.ontact.project.files.model.dto.FilesDto;
import com.kh.ontact.project.files.model.service.FilesService;
import com.kh.ontact.project.model.service.ProjectService;
import com.kh.ontact.users.model.dto.CustomUserDetails;

@Controller
@RequestMapping(value = "/files")
public class FilesListController {
	@Autowired
	private FilesDao filesDao;
	@Autowired
	private FilesService filesService;
	
	//*****파일리스트******
		// 파일삭제
		@RequestMapping(value = "/del", method = RequestMethod.POST)
		public String deletefiles(String[] fname) {
			try {
				filesService.deleteFile(fname);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/files/list";
		}

		// 여기부터 파일메뉴
		// 메인화면 이동
		@RequestMapping("/list")
		public ModelAndView getFileList() {
			ModelAndView mv = new ModelAndView();
			MediaUtils util = new MediaUtils();
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String uno = user.getUno();
			String cno = user.getCno();
			System.out.println(uno);
			try {
				List<FilesDto> list = filesDao.filelist(cno);
				for (int i = 0; i < list.size(); i++) {
					String fsize = list.get(i).getFsize();
					list.get(i).setFsize(util.getFileSize(fsize));
				}
				mv.addObject("listpj", filesDao.filepjlist(uno));
				System.out.println(filesDao.filepjlist(cno)+"프로젝트리스트");
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
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String cno = user.getCno();
			try {
				list = filesDao.fnameasc(cno);
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
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String cno = user.getCno();
			try {
				list = filesDao.fnamedesc(cno);
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
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String cno = user.getCno();
			try {
				list = filesDao.fsizeasc(cno);
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
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String cno = user.getCno();
			try {
				list = filesDao.fsizedesc(cno);
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
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String cno = user.getCno();
			try {
				list = filesDao.unameasc(cno);
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
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String cno = user.getCno();
			try {
				list = filesDao.unamedesc(cno);
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
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String cno = user.getCno();
			try {
				list = filesDao.fdateasc(cno);
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
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String cno = user.getCno();
			try {
				list = filesDao.fdatedesc(cno);
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
		// 파일삭제
		@RequestMapping(value = "/pjdel", method = RequestMethod.POST)
		public String pjdeletefiles(RedirectAttributes redirect,String[] fname, String pno) {
			try {
				filesService.deleteFile(fname);
			} catch (Exception e) {
				e.printStackTrace();
			}
			redirect.addFlashAttribute("pno2",pno);
			return "redirect:/files/pjlist";
		}

		// 파일 리스트
		@RequestMapping(value = "/pjlist")
		public ModelAndView filelistpj(@RequestParam(required = false) String pno, HttpServletRequest request) {
			ModelAndView mv = new ModelAndView();
			MediaUtils util = new MediaUtils();
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String uno = user.getUno();
			String cno = user.getCno();
			
			//파일 삭제시 페이지 유지 위함
			Map<String, ?> pno2 = RequestContextUtils.getInputFlashMap(request);
			if(pno2!=null) {
				pno = (String) pno2.get("pno2");
			}
			  
			try {
				List<FilesDto> list = filesDao.pjfilelist(pno);
				for (int i = 0; i < list.size(); i++) {
					String fsize = list.get(i).getFsize();
					list.get(i).setFsize(util.getFileSize(fsize));
				}
				mv.addObject("listpj", filesDao.filepjlist(uno));
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
