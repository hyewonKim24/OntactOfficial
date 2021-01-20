package com.kh.ontact.project.reply.model.service;

import java.util.List;

import com.kh.ontact.project.reply.model.dto.ReplyDto;

public interface ReplyService {
	
	int insertReply(ReplyDto dto) throws Exception;
	List<ReplyDto> ListReply(String pno) throws Exception;
	int deleteReply(String rno) throws Exception;
	int updateReply(ReplyDto dto) throws Exception;
	List<ReplyDto> ReplyCount(String pno) throws Exception;
}
