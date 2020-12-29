package com.kh.hllee.board.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hllee.board.model.dao.BoardDao;
import com.kh.hllee.board.model.vo.Board;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bDao;

	@Override
	public int totalCount() {
		return bDao.listCount();
	}
	@Override
	public int JavaCount() {
		return bDao.JavalistCount();
	}

	@Override
	public int OracleCount() {
		return bDao.OraclelistCount();
	}

	@Override
	public int SpringCount() {
		return bDao.SpringlistCount();
	}

	@Override
	public Board selectBoard(int chk, String board_num) {

		if (chk == 0)
			bDao.addReadCount(board_num);
		return bDao.selectOne(board_num);
	}

	@Override
	public List<Board> selectList(int startPage, int limit) {
		return bDao.selectList(startPage, limit);
	}
	
	@Override
	public List<Board> selectJavaList(int startPage, int limit) {
		return bDao.selectJavaList(startPage, limit);
	}

	@Override
	public List<Board> selectOracleList(int startPage, int limit) {
		return bDao.selectOracleList(startPage, limit);
	}

	@Override
	public List<Board> selectSpringList(int startPage, int limit) {
		return bDao.selectSpringList(startPage, limit);
	}
	@Override
	public List<Board> selectSearch(String keyword) {
		return bDao.searchList(keyword);
	}

	@Override
	public void insertBoard(Board b) {
		bDao.insertBoard(b);
	}
	
	@Override
	public Board updateBoard(Board b) {
		int result = bDao.updateBoard(b);
		if (result > 0) { // 읽어나온게 있다면
			b = bDao.selectOne(b.getBoard_num());
		} else {
			b = null; //읽어나온게 없다면
		}
		return b;
	}

	@Override
	public void deleteBoard(String board_num) { 
		bDao.deleteBoard(board_num); 
	}

	@Override
	public int addReadCount(String board_num) {
		return 0;
	}




}
