package com.kh.helloffice.hr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.hr.entity.DeptDto;
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
	public List<DeptDto> getDeptList() throws Exception {
		return dao.getDeptList();
	}

	@Override
	public int cntDepName(String depName) throws Exception {
		return dao.cntDepName(depName);
	}

	@Override
	public int insertDept(DeptDto deptDto) throws Exception {
		return dao.insertDept(deptDto);
	}

	@Override
	public int updDeptName(DeptDto deptDto) throws Exception {
		return dao.updDeptName(deptDto);
	}

	@Override
	public int delDeptName(String depName) throws Exception {
		return dao.delDeptName(depName);
	}

	@Override
	public List<MemberDto> getMemberListByDept(String deptName) throws Exception {
		return dao.getMemberListByDept(deptName);
	}

	@Override
	public List<MemberDto> getMyTeamList(String depName) throws Exception {
		return dao.getMyTeamList(depName);
	}

	@Override
	public List<MemberDto> getMemberInfo(int empNo) throws Exception {
		return dao.getMemberInfo(empNo);
	}

	@Override
	public List<MemberDto> getSearchList(MemberDto memberDto) throws Exception {
		return dao.getSearchList(memberDto);
	}


	

	

}
