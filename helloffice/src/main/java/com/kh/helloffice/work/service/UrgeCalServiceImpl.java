package com.kh.helloffice.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.work.dao.UrgeCalDao;
import com.kh.helloffice.work.entity.UrgeDto;

@Service
public class UrgeCalServiceImpl implements UrgeCalService{

	@Autowired
	private UrgeCalDao dao;

	@Override
	public void urgeInsert(UrgeDto dto) throws Exception {
		dao.urgeInsert(dto);
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return dao.countArticle(searchOption, keyword);
	}

	@Override
	public List<UrgeDto> urgeListAll(int start, int end, String searchOption, String keyword) throws Exception {
		return dao.urgeListAll(start, end,searchOption, keyword);
	}

	@Override
	public Object urgeRead(int urgeNo) {
		return dao.urgeRead(urgeNo);
	}

	@Override
	public void urgeUpdate(UrgeDto dto) {
		dao.urgeUpdate(dto);
	}

	@Override
	public void urgeDelete(int urgeNo) {
		dao.urgeDelete(urgeNo);
	}
}
