package com.kh.ontact.project.reply.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ontact.project.reply.model.dao.ReplyDao;
import com.kh.ontact.project.reply.model.dto.ReplyDto;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyDao rpDao;
	
	@Override
	public int insertReply(ReplyDto dto) throws Exception {
		return rpDao.insertReply(dto);
	}

	@Override
	public List<ReplyDto> ListReply(String pno) throws Exception {
		return rpDao.ListReply(pno);
	}

	@Override
	public int deleteReply(String rno) throws Exception {
		return rpDao.deleteReply(rno);
	}
	
	

	@Override
	public int updateReply(ReplyDto dto) throws Exception {
		return rpDao.updateReply(dto);
	}

}
