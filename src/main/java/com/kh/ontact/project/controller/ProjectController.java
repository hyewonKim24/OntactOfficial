package com.kh.ontact.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.chat.model.service.ChatService;
import com.kh.ontact.chatmember.model.dto.ChatMemberDto;
import com.kh.ontact.chatmember.model.service.ChatMemberService;
import com.kh.ontact.dept.model.dto.DeptDto;
import com.kh.ontact.dept.model.service.DeptService;
import com.kh.ontact.project.model.dto.ProjectDto;
import com.kh.ontact.project.model.service.ProjectService;
import com.kh.ontact.projectDept.model.dto.ProjectDeptDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.projectMember.model.service.ProjectMemberService;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.model.service.UsersService;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService pjService;
	@Autowired
	private DeptService deptServ;
	@Autowired
	private UsersService usersService;
	@Autowired
	private ProjectMemberService pmService;
	@Autowired
	private ChatService chatService;
	@Autowired
	private ChatMemberService chatMemService;


	// 프로젝트 전체목록
	@RequestMapping(value = "/project/all/list", method = RequestMethod.GET)
	public ModelAndView selectListProject(ModelAndView mv, Authentication authentication,
			HttpServletResponse response,@RequestParam(value = "prodelete", required = false) String prodelete) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno = userdetail.getUno();
			String cno = userdetail.getCno();
			String dno = userdetail.getDno();
			
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("uno", uno);
			paramMap.put("cno", cno);
			
			ProjectDto aaa = null;
	         if(userdetail.getAuthorities().equals("ROLE_USER")) {
	            aaa = pjService.selectOneTeam(paramMap);
	         }

			mv.addObject("pjc", pjService.selectOneCompany(uno));
			System.out.println("내 회사 결과 : " + pjService.selectOneCompany(uno));
			mv.addObject("pjd", aaa);
			System.out.println("내 부서 결과 : " + pjService.selectOneTeam(paramMap));
			mv.addObject("listpj", pjService.selectListProject(paramMap));
			System.out.println("project List 결과 : " + pjService.selectListProject(paramMap));
			if(prodelete!=null)
				mv.addObject("prodelete", "프로젝트가 1개 삭제되었습니다");
			mv.setViewName("project/projectall");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 미보관 프로젝트 목록
	@RequestMapping(value="/project/uns/list", method = RequestMethod.GET)
	public ModelAndView selectListProjectUns(ModelAndView mv, Authentication authentication, HttpServletResponse response) {
		try {
		response.setContentType("text/html;charset=UTF-8");
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno = userdetail.getUno();
		String cno = userdetail.getCno();
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("uno", uno);
		paramMap.put("cno", cno);
		
		mv.addObject("pjuns",pjService.selectListPjUns(paramMap));
		mv.setViewName("project/pjuns");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return mv;
	}
	
	// 읽지않음 프로젝트 목록
	@RequestMapping(value="/project/unread/list", method = RequestMethod.GET)
	public ModelAndView selectListPjUnread(ModelAndView mv, Authentication authentication, HttpServletResponse response) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno = userdetail.getUno();
			String cno = userdetail.getCno();
			
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("uno", uno);
			paramMap.put("cno", cno);
			
			mv.addObject("pjunread",pjService.selectListPjUnread(paramMap));
			mv.setViewName("project/pjunread");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return mv;
	}
	
	//부서별  보관함 프로젝트 리스트
	@RequestMapping(value="/project/pjteam/list", method = RequestMethod.GET)
	public ModelAndView selectListPjTeam(ModelAndView mv, 
			Authentication authentication, 
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "dname", required = false) String dname) {
		System.out.println("dname : "+ dname);
		try {
			response.setContentType("text/html;charset=UTF-8");
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno = userdetail.getUno();
			System.out.println("내 uno" + uno);

			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("uno", uno);
			paramMap.put("dname", '%'+dname+'%');
			System.out.println("paramMap:"+paramMap);
			
			mv.addObject("pjteam", pjService.selectListPjTeam(paramMap));
			mv.addObject("dname", dname);
			mv.setViewName("project/pjteam");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 사이드바 : 프로젝트 생성 모달 클릭 시 부서 보관함 목록  & 사이드바 부서보관함 목록
	@RequestMapping(value = "/project/pjteam")
	@SuppressWarnings("finally")
	@ResponseBody
	public Object selectListDeptDname(Authentication authentication) {
		List<DeptDto> dept = new ArrayList<DeptDto>();
		try {
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String cno = userdetail.getCno();
			System.out.println("내 cno" + cno);
			
			dept = deptServ.selectListDept(cno);
			System.out.println("부서보관함 목록: "+ dept);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return dept;
		}
	}

	//사이드바 : 프로젝트 생성
	@SuppressWarnings("finally")
	@RequestMapping(value="/project/all/ins", method=RequestMethod.GET)
	public String insertProject(ProjectDto pj, ProjectMemberDto pjm,
			HttpServletRequest request, RedirectAttributes rttr, Authentication authentication,
			@RequestParam(value="pname", required=true) String pname, 
			@RequestParam(value="pdesc", required=false) String pdesc, 
			@RequestParam(value="popen", defaultValue="1", required=false) int popen, 
			@RequestParam(value="dno", required=false) List<String> dno){
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno = userdetail.getUno();
		String cno = userdetail.getCno();
		
		System.out.println("프로젝트 insert controller 진입");
		System.out.println("pname: "+pname+" pdesc:"+pdesc+ " uno:"+uno+ " cno:"+cno);
		System.out.println("dno" + dno);
		List<ProjectDeptDto> pjdlist = new ArrayList<ProjectDeptDto>();
		ProjectDeptDto pjd = null;
		try {
			if(pname != null) {
				System.out.println("insert if문 진입");
				pj.setPname(pname);
				pj.setPdesc(pdesc);
				pj.setPopen(popen);
				pj.setCno(cno);
				pjm.setUno(uno);
				pjm.setCno(cno);
				if(dno !=null) {
					for(int i=0; i<dno.size(); i++ ) {
						pjd = new ProjectDeptDto();
						pjd.setDno(dno.get(i));
						pjd.setCno(cno);
						pjdlist.add(pjd);
					}
					pjService.insertProject(pj, pjm, pjdlist);	
				}else {
					pjService.insertProject(pj, pjm, pjdlist);	
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			return "redirect:list";
		}
	}
	
	
	
	//프로젝트 list 뿌리는 ajax
	@RequestMapping(value = "/project/listajax")
	@ResponseBody
	public List<ProjectDto> listajax(Authentication authentication) {
		List<ProjectDto> listpj = new ArrayList<ProjectDto>();
		try {
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String uno = userdetail.getUno();
			String cno = userdetail.getCno();
			
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("uno", uno);
			paramMap.put("cno", cno);
			System.out.println("paramMap:"+paramMap);
			
			listpj= pjService.selectListProject(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		} 
			return listpj;
	}
	// 미보관 프로젝트 목록 ajax
	@ResponseBody
	@RequestMapping(value="/project/uns/listajax", method = RequestMethod.GET)
	public List<ProjectDto> selectListProjectUns(Authentication authentication, HttpServletResponse response) {
		List<ProjectDto> pjuns = new ArrayList<ProjectDto>();
		try {
		response.setContentType("text/html;charset=UTF-8");
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno = userdetail.getUno();
		String cno = userdetail.getCno();
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("uno", uno);
		paramMap.put("cno", cno);
		
		pjuns = pjService.selectListPjUns(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return pjuns;
	}
	// 읽지않음 프로젝트 목록 ajax
	@ResponseBody
	@RequestMapping(value="/project/unread/listajax", method = RequestMethod.GET)
	public List<ProjectDto> selectListProjectUnread(Authentication authentication, HttpServletResponse response) {
		List<ProjectDto> pjunread = new ArrayList<ProjectDto>();
		try {
		response.setContentType("text/html;charset=UTF-8");
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno = userdetail.getUno();
		String cno = userdetail.getCno();
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("uno", uno);
		paramMap.put("cno", cno);
		
		pjunread = pjService.selectListPjUnread(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return pjunread;
	}
	
	// 부서별 프로젝트 목록 ajax
	@ResponseBody
	@RequestMapping(value="/project/pjteam/listajax", method = RequestMethod.GET)
	public List<ProjectDto> selectListProjectTeam(Authentication authentication, HttpServletResponse response,
			@RequestParam(name = "dname") String dname) {
		System.out.println("부서 에이작스 진입 ");
		List<ProjectDto> pjteam = new ArrayList<ProjectDto>();
		try {
		response.setContentType("text/html;charset=UTF-8");
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String uno = userdetail.getUno();
		System.out.println("내 uno" + uno);
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("uno", uno);
		paramMap.put("dname", '%'+dname+'%');
		System.out.println("부서 에이작스 "+ paramMap);
		
		pjteam = pjService.selectListPjTeam(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return pjteam;
	}
	
	
	//프로젝트 멤버 초대 창 열기
	//채팅방 초대하기
	@RequestMapping(value = "/project/projectinvite", method = RequestMethod.GET)
	public ModelAndView projectinvite(@RequestParam(name = "pno") String pno, ModelAndView mv, UsersDto dto) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String cno = user.getCno();
		String uno = user.getUno();
		dto.setPno(pno);
		dto.setCno(cno);
		dto.setUno(uno);
		List<UsersDto> ulist = null;
		try {
			ulist=usersService.projectInviteList(dto);
			System.out.println("프로젝트 초대 리스트:"+ulist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("ulist", ulist);
		mv.addObject("pno", pno);
		mv.setViewName("project/projectinvite");
		return mv;
	}
	
	//프로젝트 멤버  insert
	@RequestMapping(value = "/project/projectmemberinsert")
	public ModelAndView projectmemberinsert(@RequestParam(name = "uno") List<String> uno,
			@RequestParam(value = "pno", required = false) int pno, ModelAndView mv) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String cno = user.getCno();
		List<ProjectMemberDto> listdto = new ArrayList<ProjectMemberDto>();
		ProjectMemberDto dto =null;
		String ppno= Integer.toString(pno);
		int membercount =0;
		String mcount=null;
		ChatMemberDto chatdto =null;
		List<ChatMemberDto> chatlist = new ArrayList<ChatMemberDto>();
		try {
			//프로젝트 채팅방에 추가하기
			String chatno = chatService.searchProChat(ppno);
			for (String a : uno) {
				dto = new ProjectMemberDto();
				dto.setPno(ppno);
				dto.setCno(cno);
				dto.setUno(a);
				listdto.add(dto);
				membercount++;
				
				//프로젝트 채팅방 추가
				if(chatno!=null) {
					chatdto = new ChatMemberDto();
					chatdto.setUno(a);
					chatdto.setCreatchat(0);
					chatdto.setChatno(chatno);
					chatlist.add(chatdto);
				}
				System.out.println("카운트:"+membercount);
				}
			int rs =pmService.projectMeberinvite(listdto);
			System.out.println("멤버추가"+rs);
			mcount=Integer.toString(membercount);

			if(chatno!=null) {
				int chatrs = chatMemService.projectInsertmember(chatlist);
				System.out.println("플젝채팅방에 멤버 추가됨:"+chatrs);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("mcount", mcount);
		mv.addObject("pno",ppno);
		mv.setViewName("redirect:/project/pjdetail");
		return mv;
	}
	
	//프로젝트 삭제
	@RequestMapping(value = "/project/deleteprojcet")
	public ModelAndView deleteProject(@RequestParam(name = "pno") String pno, ModelAndView mv) {
		System.out.println("프로젝트 삭제 컨트롤러 진입");
		int rs =0;
		try {
			rs = pjService.deleteProject(pno);
			System.out.println("프로젝트 삭제:"+rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("prodelete", rs);
		mv.setViewName("redirect:/project/all/list");
		return mv;
	}
	
}