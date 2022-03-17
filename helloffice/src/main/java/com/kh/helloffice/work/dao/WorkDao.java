package com.kh.helloffice.work.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.helloffice.work.entity.WorkDto;
import com.kh.helloffice.work.entity.WorkEditDto;
import com.kh.helloffice.work.entity.WorkPageVo;

public interface WorkDao {

	//work insert
	int insert(WorkDto dto) throws Exception;

	List<WorkDto> selectlist(int start, int end, String searchType, String searchValue) throws Exception;

	int countArticle(String searchType, String searchValue) throws Exception;
	
	int edit(WorkDto dto);

	int delete(WorkDto dto);

	WorkDto getWorkInOut(WorkDto dto) throws Exception;

	int workOut(WorkDto dto) throws Exception;

	int getWorkCnt() throws Exception;

	List<WorkDto> selectWeekList();

	List<WorkDto> selectYearList(int start, int end, String searchType, String searchValue) throws Exception;

	List<WorkDto> selectMonthList();

	int yearCountArticle(String searchType, String searchValue) throws Exception;

	int editUpdate(WorkEditDto edto);

	
}
