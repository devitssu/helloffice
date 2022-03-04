package com.kh.helloffice.work.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.helloffice.work.entity.WorkDto;

public interface WorkService {
	
	int enrollWork(WorkDto dto); //바디가 없으니 추상 메소드

	List<WorkDto> selectList();

	int edit(WorkDto dto);

	int delete(WorkDto dto);

	WorkDto workIn(WorkDto dto) throws Exception;
	
	 
	
}
