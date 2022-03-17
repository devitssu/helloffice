package com.kh.helloffice.work.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.helloffice.work.entity.WorkDto;
import com.kh.helloffice.work.entity.WorkEditDto;
import com.kh.helloffice.work.entity.WorkPageVo;

public interface WorkService {
	
	int enrollWork(WorkDto dto) throws Exception; //바디가 없으니 추상 메소드

	List<WorkDto> selectList(int start, int end, String searchType, String searchValue) throws Exception;

	int countArticle(String searchType, String searchValue) throws Exception;
	
	int edit(WorkDto dto);

	int delete(WorkDto dto);

	WorkDto workIn(WorkDto dto) throws Exception;

	int workOut(WorkDto dto) throws Exception;

	int getWorkCnt() throws Exception;

	List<WorkDto> selectWeekList();

	List<WorkDto> selectYearList(int start, int end, String searchType, String searchValue) throws Exception;

	List<WorkDto> selectMonthList();

	int yearCountArticle(String searchType, String searchValue) throws Exception;

	int editUpdate(WorkEditDto edto);

	
	
	 
	
}
