package com.kh.helloffice.work.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.work.entity.WorkEditDto;

@Repository
public class WorkEditDaoImpl implements WorkEditDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public void insert(WorkEditDto dto) {
		ss.insert("workEdit.insert", dto);
	}

}
