package com.kh.helloffice.hr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.hr.entity.PageVo;
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

	@Override
	public List<MemberDto> getRepTeamList() throws Exception {
		return dao.getRepTeamList();
	}

	@Override
	public List<MemberDto> getMarkTeamList() throws Exception {
		return dao.getMarkTeamList();
	}

	@Override
	public List<MemberDto> getSalesTeamList() throws Exception {
		return dao.getSalesTeamList();
	}

	@Override
	public List<MemberDto> getDesignTeamList() throws Exception {
		return dao.getDesignTeamList();
	}

	@Override
	public List<DeptDto> getDeptList() throws Exception {
		return dao.getDeptList();
	}

	

}
