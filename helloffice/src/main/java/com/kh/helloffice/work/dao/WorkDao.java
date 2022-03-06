package com.kh.helloffice.work.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.helloffice.work.entity.WorkDto;

public interface WorkDao {

	//work insert
	int insert(WorkDto dto) throws Exception;

	List<WorkDto> selectlist() throws Exception;

	int edit(WorkDto dto);

	int delete(WorkDto dto);

	WorkDto getWorkInOut(WorkDto dto) throws Exception;

	int workOut(WorkDto dto) throws Exception;
}
