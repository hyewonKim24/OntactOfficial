package com.kh.hllee.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hllee.board.model.vo.BoardReply;

@Repository("brDao")
public class BoardReplyDao {
	@Autowired
	private SqlSession sqlSession;

	public List<BoardReply> selectList(String board_num) { // 게시글에 해당하는 댓글 조회 
		return sqlSession.selectList("BoardReply.selectBoardReplyAll", board_num);
	}

	public BoardReply selectOne(String comment_id) { // 단일 댓글 조회 
		return sqlSession.selectOne("BoardReply.selectBoardReply", comment_id);
	}

	public int insertBoardReply(BoardReply br) { // 댓글 입력 
		return sqlSession.insert("BoardReply.insertBoardReply", br);
	}

	public int updateBoardReply(BoardReply br){ //댓글수정 
		System.out.println(br);
		return sqlSession.update("BoardReply.updateBoardReply", br);
	}

	public int deleteBoardReply(BoardReply br) { // 댓글 삭제 
		System.out.println(br);
		return sqlSession.delete("BoardReply.deleteBoardReply", br);
	}
}
