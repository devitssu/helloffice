package com.kh.helloffice.work.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.helloffice.work.entity.WorkDto;

public interface WorkDao {

	//work insert
	int insert(WorkDto dto);

	List<WorkDto> selectlist();

	int edit(WorkDto dto);

	int delete(WorkDto dto);
}
