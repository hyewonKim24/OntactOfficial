package com.kh.ontact.project.commonboard.model.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.alert.model.dto.AlertDto;
import com.kh.ontact.alert.model.service.AlertService;
import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.commonboard.model.dao.CommonboardDao;
import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.files.model.dao.FilesDao;
import com.kh.ontact.project.files.model.dto.FilesDto;
import com.kh.ontact.projectMember.model.dto.ProjectMemberDto;
import com.kh.ontact.projectMember.model.service.ProjectMemberService;

@Service("commonboardService")
public class CommonboardServiceImpl implements CommonboardService{
	@Autowired
	BoardAllDao boardalldao;
	@Autowired
	CommonboardDao commonboardDao;
	@Autowired
	FilesDao filesdao;
	//혜원 알림기능 추가
	@Autowired
	ProjectMemberService pmService;
	@Autowired
	AlertService alertService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommonboardServiceImpl.class);
	
	// 글+파일 인서트
	@Override
	public void insertCommonboard(FilesDto file, BoardAllDto alldto, CommonboardDto dto) throws Exception{
		System.out.println("일반글 서비스 들어옴");
		boardalldao.insertBoardAllTask(alldto);
		commonboardDao.insertCommonboard(dto);
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		System.out.println("알림인서트 시작");
		//알림 기능 ( 나 제외한 프로젝트 멤버들에게 알림 추가 ) 
		ProjectMemberDto pmdto= new ProjectMemberDto();
		pmdto.setUno(alldto.getUno());
		pmdto.setPno(alldto.getPno());
		AlertDto adto = null;
		List<String> plist =pmService.AlertProList(pmdto);
		System.out.println("프로젝트 리스트:"+plist);
		int ars = 0;
		for(int i=0;i<plist.size();i++) {
			adto = new AlertDto();
			adto.setUno(plist.get(i));
			adto.setPno(alldto.getPno());
			adto.setAcontent(alldto.getUname()+"님이 ["+alldto.getBname()+"]글을 1개 등록했습니다.");
			ars += alertService.alertInsert(adto);
		}
		System.out.println("일반글"+ars+"개 알림등록");
		//혜원 끝
				
		
		//파일이 없다면
		if(file.getFilelist()==null)
			return;
		//파일이 있다면
		int listsize = file.getFilelist().size();
		int result = 0;
		for(int i=0; i<listsize; i++) {
			paramMap.put("pno", alldto.getPno());
			paramMap.put("uno", alldto.getUno());
			paramMap.put("fname", file.getFilelist().get(i).getFname());
			paramMap.put("fsize", file.getFilelist().get(i).getFsize());
			paramMap.put("fpath", file.getFilelist().get(i).getFpath());
			paramMap.put("imgsrc", file.getFilelist().get(i).getImgsrc());
			paramMap.put("foriginalname", file.getFilelist().get(i).getForiginalname());
			System.out.println("맵"+paramMap);
			result += filesdao.addFile(paramMap);
		}
		System.out.println(result+"행 추가되었습니다.");
	}
	
	// 글+파일삭제
	public int deleteCommonboard(int bno) throws Exception{
//		filesdao.deleteFiles(bno);
//		commonboardDao.deleteCommonboard(bno);
		return boardalldao.deleteBoardall(bno);
	}
	
	// 글뿌리기 (임시)
	public List<CommonboardDto> getCommonboard() throws Exception{
		return commonboardDao.getCommonboard();
	}
	
	// 파일뿌리기
	public List<FilesDto> getFileboard(String pno) throws Exception{
		return filesdao.getFileboard(pno);
	}
}
