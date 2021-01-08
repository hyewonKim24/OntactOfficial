package com.kh.ontact.dept.model.service;

import java.util.List;

import com.kh.ontact.dept.model.dao.DeptDao;
import com.kh.ontact.dept.model.dto.DeptDto;

public interface DeptService {
	public List<DeptDto> selectListDeptDname();
}
