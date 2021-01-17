package com.kh.ontact.project.boardall.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.boardall.model.dao.BoardAllDao;
import com.kh.ontact.project.boardall.model.dto.BoardAllDto;

@Service("baService")
public class BoardAllServiceImpl implements BoardAllService{
	@Autowired
	private BoardAllDao baDao;
	@Override
	public List<BoardAllDto> ListTaskBoardAll(String pno) throws Exception {
		return baDao.ListTaskBoardAll(pno);
	}

}
