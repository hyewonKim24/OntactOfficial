package com.kh.ontact.approval.model.dao;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ontact.approval.model.dto.ApprovalDto;
import java.util.List;
@Repository("apDao")
public class ApprovalDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	public int listCount() {
		return sqlSession.selectOne("Approval.listCount");
	}
	
	public int insertApproval(ApprovalDto dto) { // 기안작성
		return sqlSession.insert("Approval.insertApproval", dto);
	}
	
	public List<ApprovalDto> selectList(int startPage, int limit, String uno){
		int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
		RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowboun
		return sqlSession.selectList("Approval.selectList", uno, row);
	}
	
	public ApprovalDto selectOne(String apno) { //글 가져오기
		return sqlSession.selectOne("Approval.selectOne", apno);
		
	}
	
	public int stateupdate(ApprovalDto dto) { //결재완료
		return sqlSession.update("Approval.updatestate",dto);
	}
	
	public int updateaprejection(ApprovalDto dto)  { //반려사유
		return sqlSession.update("Approval.updateaprejection",dto);
	}
	

}
