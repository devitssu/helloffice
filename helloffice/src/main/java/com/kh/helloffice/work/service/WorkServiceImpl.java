package com.kh.helloffice.work.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.helloffice.work.dao.WorkDao;
import com.kh.helloffice.work.dao.WorkDaoImpl;
import com.kh.helloffice.work.entity.WorkDto;

@Component
public class WorkServiceImpl implements WorkService{
	
	@Autowired
	private WorkDao dao;//스프링에게 달라고하기
	
	@Override
	public int enrollWork(WorkDto dto) {
		//게시글 등록, -> Dao가 할일
		//실행 결과 반환
		return dao.insert(dto);
	}

}
