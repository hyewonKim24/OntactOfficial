package com.kh.ontact.approval.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.ontact.approval.model.dao.ApprovalDao;
import com.kh.ontact.approval.model.dto.ApprovalDto;


@Service("ApproService")
@Repository
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private ApprovalDao apDao;
	
	@Override
	public int totalCount() {
		return apDao.listCount();
	}
	
	@Override
	public void insertApproval(ApprovalDto dto) throws Exception{
		apDao.insertApproval(dto);
	}
	
	@Override
	public List<ApprovalDto> selectList(int startPage, int limit, String uno) {
		return apDao.selectList(startPage,limit,uno);
	}

	@Override
	public int listCount() {
		return apDao.listCount();
	}

	@Override
	public ApprovalDto selectOne(int chk,String apno) {
		return apDao.selectOne(apno);
	}

	@Override
	public ApprovalDto stateupdate(ApprovalDto dto) {
		int result = apDao.stateupdate(dto);
		if (result > 0) {
			dto = apDao.selectOne(dto.getApno());
		} else {
			dto = null;
		}
			
		return dto;
	}

	@Override
	public ApprovalDto updateaprejection(ApprovalDto dto) {
		int result = apDao.updateaprejection(dto);
		if(result > 0 ) {
			dto = apDao.selectOne(dto.getApno());
		} else {
			dto = null;
		}
		
		return dto;
		
	}
		

}
