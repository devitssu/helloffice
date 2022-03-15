package com.kh.helloffice.email.dao;

import java.util.List;

import com.kh.helloffice.hr.entity.DeptDto;

public interface EmailDao {

	List<DeptDto> getDeptList() throws Exception;

}
