package com.kh.helloffice.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.work.dao.WorkEditDao;
import com.kh.helloffice.work.entity.WorkEditDto;

@Service
public class WorkEditServiceImpl implements WorkEditService{

	@Autowired
	private WorkEditDao dao;
	
	@Override
	public void enrollEdit(WorkEditDto dto) {
		dao.insert(dto);
	}

}
