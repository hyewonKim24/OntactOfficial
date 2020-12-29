package com.kh.hllee.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hllee.board.model.dao.BoardReplyDao;
import com.kh.hllee.board.model.vo.BoardReply;

@Service("brService")
public class BoardReplyServiceImpl implements BoardReplyService {
	
	@Autowired
	private BoardReplyDao brDao;

	@Override
	public BoardReply selectBoardReply(String comment_id) {
		return brDao.selectOne(comment_id);
	}

	@Override
	public List<BoardReply> selectList(String board_num) {
		return brDao.selectList(board_num);
	}

	@Override
	public int insertBoardReply(BoardReply br) {
		return brDao.insertBoardReply(br);
	}

	@Override
	public int updateBoardReply(BoardReply br) {
		return brDao.updateBoardReply(br);
	}

	@Override
	public int deleteBoardReply(BoardReply br) {
		return brDao.deleteBoardReply(br);
	}

}
