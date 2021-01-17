package com.kh.ontact.project.commonboard.model.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.commons.util.MediaUtils;
import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.commonboard.model.dao.CommonboardDao;
import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.files.model.dao.FilesDao;
import com.kh.ontact.project.files.model.dto.FilesDto;

@Service("commonboardService")
public class CommonboardServiceImpl implements CommonboardService{
	@Autowired
	BoardAllDao boardalldao;
	@Autowired
	CommonboardDao commonboardDao;
	@Autowired
	FilesDao filesdao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommonboardServiceImpl.class);
	
	// 글+파일 인서트
	@Override
	public void insertCommonboard(FilesDto file, BoardAllDto alldto, CommonboardDto dto) throws Exception{
		boardalldao.insertBoardAllTask(alldto);
		commonboardDao.insertCommonboard(dto);
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		int listsize = file.getFilelist().size();
		System.out.println(listsize);
		//파일이 없다면
		if(listsize==0)
			return;
		//파일이 있다면
		
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
	public void deleteCommonboard(String bno) throws Exception{
		filesdao.deleteFiles(bno);
		commonboardDao.deleteCommonboard(bno);
		boardalldao.deleteBoardall(bno);
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
