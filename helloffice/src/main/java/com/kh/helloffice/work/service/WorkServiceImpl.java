package com.kh.helloffice.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.kh.helloffice.work.dao.WorkDao;
import com.kh.helloffice.work.dao.WorkDaoImpl;
import com.kh.helloffice.work.entity.WorkDto;

@Service
public class WorkServiceImpl implements WorkService{
	
	@Autowired
	private WorkDao dao;//스프링에게 달라고하기
	
	@Override
	public int enrollWork(WorkDto dto) throws Exception {
		//게시글 등록, -> Dao가 할일
		//실행 결과 반환
		return dao.insert(dto);
	}

	@Override
	public List<WorkDto> selectList() throws Exception {
		return dao.selectlist();
	}

	@Override
	public int edit(WorkDto dto) {
		return dao.edit(dto);
	}

	@Override
	public int delete(WorkDto dto) {
		return dao.delete(dto);
	}

	@Override
	public WorkDto workIn(WorkDto dto) throws Exception {
		
		return dao.getWorkInOut(dto);
	}

	@Override
	public int workOut(WorkDto dto) throws Exception {
		
		return dao.workOut(dto);
	}

}
