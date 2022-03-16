package com.kh.helloffice.work.service;

import java.util.List;

import com.kh.helloffice.work.entity.CalDto;
import com.kh.helloffice.work.entity.UrgeDto;

public interface UrgeCalService {

	
	////////촉구
	
	void urgeInsert(UrgeDto dto) throws Exception;

	int countArticle(String searchOption, String keyword) throws Exception;

	List<UrgeDto> urgeListAll(int start, int end, String searchOption, String keyword) throws Exception;

	Object urgeRead(int urgeNo) throws Exception;

	void urgeUpdate(UrgeDto dto) throws Exception;

	void urgeDelete(int urgeNo) throws Exception;

	
	///////정산
	
	void calInsert(CalDto dto) throws Exception;

	List<CalDto> selectEmpList(CalDto dto) throws Exception;

	Object calRead(int calNo) throws Exception;

	void calUpdate(CalDto dto) throws Exception;

	void calDelete(int calNo) throws Exception;

}
