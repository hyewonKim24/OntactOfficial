package com.kh.ontact.approval.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.approval.model.dto.ApprovalDto;

@Repository("apDao")
public class ApprovalDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertApproval(ApprovalDto dto) { // 기안작성
		return sqlSession.insert("Approval.insertApproval", dto);
	}
	

}
