package com.kh.helloffice.email.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.hr.entity.DeptDto;

@Repository
public class EmailDaoImpl implements EmailDao {
	
	@Autowired
	private SqlSession ss;

	@Override
	public List<DeptDto> getDeptList() throws Exception {
		return ss.selectList("hr.getDeptList");
	}

}
