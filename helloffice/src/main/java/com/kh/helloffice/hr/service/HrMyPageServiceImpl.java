package com.kh.helloffice.hr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.hr.dao.HrMyPageDao;
import com.kh.helloffice.hr.entity.CareerDto;
import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.member.entity.MemberDto;

@Service
public class HrMyPageServiceImpl implements HrMyPageService{
	
	@Autowired
	private HrMyPageDao dao;
	

	@Override
	public MemberDto editInsaPage(MemberDto dto) throws Exception {
		int result = dao.editInsaPage(dto);
		
		MemberDto updatedMember = null;
		if(result > 0) {
			updatedMember = dao.getMember(dto);
		}
		return updatedMember;
	}


	@Override
	public MemberDto editBasicPage(MemberDto dto) throws Exception {
		int result = dao.editBasicPage(dto);
		
		MemberDto updatedMember = null;
		if(result > 0) {
			updatedMember = dao.getMember(dto);
		}
		return updatedMember;
	}


	@Override
	public List<DeptDto> getDeptList() throws Exception {
		return dao.getDeptList();
	}


	@Override
	public List<MemberDto> getInsaPageInfo(int empNo) throws Exception {
		return dao.getInsaPageInfo(empNo);
	}


	@Override
	public List<MemberDto> getBasicPageInfo(int empNo) throws Exception {
		return dao.getBasicPageInfo(empNo);
	}


	@Override
	public List<CareerDto> getCareerInfo(int empNo) throws Exception {
		return dao.getCareerInfo(empNo);
	}

}
