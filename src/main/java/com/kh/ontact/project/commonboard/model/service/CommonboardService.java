package com.kh.ontact.project.commonboard.model.service;

import java.util.List;

import com.kh.ontact.project.boardall.model.dto.BoardAllDto;
import com.kh.ontact.project.commonboard.model.dto.CommonboardDto;
import com.kh.ontact.project.files.model.dto.FilesDto;

public interface CommonboardService {
	public void insertCommonboard(FilesDto file, BoardAllDto alldto, CommonboardDto dto) throws Exception;
	public int deleteCommonboard(int bno) throws Exception;
	public List<CommonboardDto> getCommonboard() throws Exception; //임시
	public List<FilesDto> getFileboard(String pno) throws Exception;
}
