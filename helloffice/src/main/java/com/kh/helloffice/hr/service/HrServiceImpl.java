package com.kh.helloffice.hr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.hr.dao.HrDao;
import com.kh.helloffice.member.entity.MemberDto;

@Service
public class HrServiceImpl implements HrService {
	
	@Autowired
	public HrDao dao;

	@Override
	public List<MemberDto> getTeamList() throws Exception {
		return dao.getTeamList();
	}

}
