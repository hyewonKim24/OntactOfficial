package com.kh.ontact.approval.model.service;

import java.util.List;

import com.kh.ontact.approval.model.dto.ApprovalDto;

public interface ApprovalService {
	public int totalCount();
	public void insertApproval(ApprovalDto dto) throws Exception;
	public List<ApprovalDto> selectList(int startPage, int limit, String uno);
	public int listCount();
	public ApprovalDto selectOne(int chk, String apno);
	
	public ApprovalDto stateupdate(ApprovalDto dto);
	public ApprovalDto updateaprejection(ApprovalDto dto);

}
