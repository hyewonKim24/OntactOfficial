package com.kh.ontact.dept.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ontact.company.model.dao.CompanyDao;
import com.kh.ontact.company.model.dto.CompanyDto;
import com.kh.ontact.dept.model.dto.DeptDto;
import com.kh.ontact.dept.model.service.DeptService;
import com.kh.ontact.project.model.dao.ProjectDao;
import com.kh.ontact.project.model.dto.ProjectDto;
import com.kh.ontact.project.model.service.ProjectService;
import com.kh.ontact.project.schedule.model.dto.ScheduleDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.projectMember.model.service.ProjectMemberService;
import com.kh.ontact.users.model.dao.UsersDao;
import com.kh.ontact.users.model.dto.CustomUserDetails;
import com.kh.ontact.users.model.dto.UsersDto;
import com.kh.ontact.users.model.service.UsersService;
//
@Controller
public class DeptController {
	@Autowired
	private DeptService deptServ;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private UsersDao usersDao;
	
	@Autowired
	private ProjectDao pjDao;
	
	@Autowired
	private ProjectMemberService pmService;
	
	public static final int LIMIT = 10;
	
	//부서
	@SuppressWarnings("unused")
	@RequestMapping(value = "/commute/organlist", method = RequestMethod.GET)
	public ModelAndView selectDept(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "dname", required = false) String dname,
			Authentication authentication, ModelAndView mv) {
			System.out.println("Dept 리스트진입");
			System.out.println("부서이름이 들어왔나?" + dname);
			
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String cno=userdetail.getCno();
			System.out.println("세션값확인 : " + cno);
			
			
		try {
			String cname = companyDao.cnameOne(cno);
			HashMap<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("cno", cno);
			paramMap.put("dname", dname);
			//
			int currentPage = page;
//			부서 출력
			int deptlistCount1 = deptServ.listCount(cno);
			int deptlistCount2 = deptServ.searchlistCount();
//			부서 사원 출력
			int listCount1 = usersService.listCountFirst(cno);
			int listCount2 = usersService.listCount(paramMap);
			System.out.println("미분류부서 : " + listCount1 );
			System.out.println("분류부서 : " + listCount2);
			
			int maxPage1 = (int) ((double) listCount1 / LIMIT + 0.9);
			int maxPage2 = (int) ((double) listCount2 / LIMIT + 0.9);
			
			
			mv.addObject("deptlistCount", deptlistCount1);
			mv.addObject("selectDept", deptServ.selectDept(cno));
			System.out.println("뭐지" + deptServ.selectDept(cno));
			mv.setViewName("/commute/organogram");

//			미분류그룹 default
			if (dname == null) {
				System.out.println("#####if로 들어옴");
				mv.addObject("userslistCount", listCount1);
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage1);
				mv.addObject("dname", "미분류그룹");
				mv.addObject("cname", cname);
				mv.addObject("list", usersService.selectOgFirst(currentPage, LIMIT, cno));
				System.out.println("결과" + usersService.selectOgFirst(currentPage, LIMIT, cno));
				mv.setViewName("/commute/organogram");
			}
			else if (dname != null){
				System.out.println("######dname이 있는 경우");
				mv.addObject("userslistCount", listCount2);
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage2);
				mv.addObject("dname", dname);
				mv.addObject("cname", cname);
				mv.addObject("list", usersService.selectOgUser(currentPage, LIMIT, paramMap));
				System.out.println("결과222" + usersService.selectOgUser(currentPage, LIMIT, paramMap));
				mv.setViewName("/commute/organogram");
			} 
//			부서검색			
			if(keyword != null && keyword != "") {
				mv.addObject("deptlistCount", deptlistCount2);
				mv.addObject("list", deptServ.searchDept(keyword));
				mv.setViewName("/commute/organogram");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	//부서 변경
	@RequestMapping(value = "/commute/organuserupdate", method = RequestMethod.POST)
	public ModelAndView updateDept(DeptDto d, 
				@RequestParam(name = "deptSelect") String dno,
				@RequestParam(name = "chk") List<String> uno,
				ModelAndView mv, Authentication authentication) {
		CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
		String cno=userdetail.getCno();
		
		System.out.println("부서번호" + dno);
		System.out.println("사원번호" + uno);
		List<UsersDto> list = new ArrayList<UsersDto>();
		List<ProjectMemberDto> pmlist = new ArrayList<ProjectMemberDto>();
		ProjectMemberDto pmdto = null;
		UsersDto one = null;
		try {
			String deptpno = deptServ.selectDeptPno(dno);
			System.out.println("deptPno:"+deptpno);

			for(int i = 0; i < uno.size(); i++) {
				one = new UsersDto();
				one.setUno(uno.get(i));
				one.setDno(dno);
				list.add(one);
				
				pmdto = new ProjectMemberDto();
				pmdto.setUno(uno.get(i));
				pmdto.setPno(deptpno);
				pmdto.setCno(cno);
				pmlist.add(pmdto);
			}
			deptServ.updateDept(list);
			int rs = pmService.projectMeberinvite(pmlist);
			System.out.println(" 부서 프로젝트에 "+ rs+"명 insert됨.");
			
			
			mv.setViewName("redirect:/commute/organlist");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	//
	//부서 생성
	@RequestMapping(value = "/commute/deptins", method = {RequestMethod.POST,RequestMethod.GET})
	public String insertDept(DeptDto d, RedirectAttributes rttr, Authentication authentication) {
		try {
			System.out.println("부서 생성 인서트진입");
			System.out.println(d.getDname());
			System.out.println(d.getCno());
			
			CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			String cno=userdetail.getCno();
			String uno=userdetail.getUno();
			System.out.println("세션값확인 : " + cno);
			
			
			HashMap<String, String> paramMap1 = new HashMap<String, String>();
			paramMap1.put("pname", d.getDname());
			paramMap1.put("cno", cno);
			
			HashMap<String, String> paramMap2 = new HashMap<String, String>();
			paramMap2.put("uno", uno);
			paramMap2.put("cno", cno);
			
			deptServ.insertDept(d);
			usersDao.joinPjChange(paramMap1);
			usersDao.joinPjMemChange(paramMap2);
			usersDao.joinPjDeptChange(cno);
			
			rttr.addFlashAttribute("message", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:/commute/organlist";
	}
	
	//부서 삭제
//		@SuppressWarnings("unused")
//		@ResponseBody
@RequestMapping(value = "/commute/deptdel", method = RequestMethod.POST)
		public ModelAndView deleteDept(
				@RequestParam(name = "dname") String dname,
				@RequestParam(name = "dno") String dno,
				@RequestParam(name = "cno") String cno,
				@RequestParam(name = "pno") String pno,
				Authentication authentication, HttpServletRequest request,
				ModelAndView mv,HttpServletResponse response) {
				
			try {
				System.out.println("부서 삭제 인서트진입");
				System.out.println("부서번호 : "+dno);
				System.out.println("회사번호 : "+ cno);
				System.out.println("부서이름 : "+ dname);
				System.out.println("플이름 : "+ pno);
				
				HashMap<String, String> paramMap1 = new HashMap<String, String>();
				paramMap1.put("cno", cno);
				paramMap1.put("dname", dname);
				//
				HashMap<String, String> paramMap2 = new HashMap<String, String>();
				paramMap2.put("cno", cno);
				paramMap2.put("dno", dno);

				List<UsersDto> deptUserList = usersService.deleteOgUser(paramMap1);
				List<ProjectDto> pjUserList = pjDao.PjUserListDept(pno);
				System.out.println("어떤게들어있나1111 : " + pjUserList);
				System.out.println("어떤게들어있나2222 : " + deptUserList);
				System.out.println("크기가 몇일ㄲ까 : " + deptUserList.size());
				//
				if(deptUserList.size() == 0 || deptUserList == null) { //부서에 사람이 없는 경우만 삭제 가능하도록
					int rs1 = deptServ.deleteDept(paramMap2);
					System.out.println("몇개 ? 1111" + rs1);
					if(pjUserList.size() == 1) {
						int rs2 = pjDao.deleteProject(pno);
						System.out.println("몇개 ? 2222" + rs2);
						System.out.println("프로젝트 삭제 함");
					}else {
						System.out.println("프로젝트 삭제 안함");
					}
					System.out.println("부서에 사원이 없는 경우!!!");
					mv.addObject("message2", "success");
					mv.setViewName("redirect:/commute/organlist");
				} else {
					System.out.println("부서에 사원이 있는 경우!!!");
					mv.addObject("message2", "failed");
					mv.setViewName("redirect:/commute/organlist");
				}
			} catch (Exception e) {
				
			}
			mv.setViewName("redirect:/commute/organlist");
			return mv;
			
		}
	
	
}
