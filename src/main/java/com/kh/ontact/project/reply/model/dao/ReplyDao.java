package com.kh.ontact.project.reply.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.project.reply.model.dto.ReplyDto;

@Repository("rpDao")
public class ReplyDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertReply(ReplyDto dto) throws Exception{
		return sqlSession.insert("Reply.insertReply", dto);
	}
	public List<ReplyDto> ListReply(String pno) throws Exception{
		return sqlSession.selectList("Reply.ListReply", pno);
	}
	public int deleteReply(String rno) throws Exception{
		return sqlSession.delete("Reply.deleteReply", rno);
	}
	public int deleteReplyAll(int bno) throws Exception{
		return sqlSession.delete("Reply.deleteReplyAll", bno);
	}
	public int updateReply(ReplyDto dto) throws Exception{
		return sqlSession.update("Reply.updateReply", dto);
	}
	
}
