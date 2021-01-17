package com.kh.ontact.project.boardall.model.service;

import java.util.List;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;

public interface BoardAllService {
	List<BoardAllDto> ListTaskBoardAll(String pno) throws Exception;
}
