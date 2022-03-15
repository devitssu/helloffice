package com.kh.helloffice.work.service;

import java.util.List;

import com.kh.helloffice.work.entity.UrgeDto;

public interface UrgeCalService {

	void urgeInsert(UrgeDto dto) throws Exception;

	int countArticle(String searchOption, String keyword) throws Exception;

	List<UrgeDto> urgeListAll(int start, int end, String searchOption, String keyword) throws Exception;

	Object urgeRead(int urgeNo);

	void urgeUpdate(UrgeDto dto);

	void urgeDelete(int urgeNo);

}
