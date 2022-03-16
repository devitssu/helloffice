package com.kh.helloffice.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.work.dao.UrgeCalDao;
import com.kh.helloffice.work.entity.CalDto;
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
	public Object urgeRead(int urgeNo) throws Exception {
		return dao.urgeRead(urgeNo);
	}

	@Override
	public void urgeUpdate(UrgeDto dto) throws Exception {
		dao.urgeUpdate(dto);
	}

	@Override
	public void urgeDelete(int urgeNo) throws Exception {
		dao.urgeDelete(urgeNo);
	}

	
	/////////////정산
	
	
	@Override
	public void calInsert(CalDto dto) throws Exception {
		dao.calInsert(dto);
	}

	@Override
	public List<CalDto> selectEmpList(CalDto dto) throws Exception {
		return dao.selectEmpList(dto);
	}

	@Override
	public Object calRead(int calNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.calRead(calNo);
	}

	@Override
	public void calUpdate(CalDto dto) throws Exception {
		dao.calUpdate(dto);
		
	}

	@Override
	public void calDelete(int calNo) throws Exception {
		dao.calDelete(calNo);
	}
}
