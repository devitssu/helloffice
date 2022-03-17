package com.kh.helloffice.hr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.hr.entity.AllDto;
import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.hr.entity.InsaNoteDto;
import com.kh.helloffice.member.entity.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class HrDaoImpl implements HrDao{
	
	@Autowired
	public SqlSession ss;

	@Override
	public List<MemberDto> getTeamList() throws Exception {
		return ss.selectList("hr.getTeamList");
	}

	@Override
	public List<DeptDto> getDeptList() throws Exception {
		return ss.selectList("hr.getDeptList");
	}

	@Override
	public int getDeptCnt() throws Exception {
		return ss.selectOne("hr.getDeptCnt");
	}

	@Override
	public int cntDepName(String depName) throws Exception {
		return ss.selectOne("hr.cntDepName", depName);
	}

	@Override
	public int insertDept(DeptDto deptDto) throws Exception {
		return ss.insert("hr.insertDept", deptDto);
	}

	@Override
	public int updDeptName(DeptDto deptDto) throws Exception {
		return ss.update("hr.updDeptName", deptDto);
	}

	@Override
	public int delDeptName(String depName) throws Exception {
		return ss.update("hr.delDeptName",depName);
	}

	@Override
	public List<MemberDto> getMemberListByDept(String deptName) throws Exception {
		return ss.selectList("hr.getMemberListByDept", deptName);
	}

	@Override
	public List<MemberDto> getMyTeamList(String depName) throws Exception {
		return ss.selectList("hr.getMyTeamList", depName);
	}

	@Override
	public AllDto getMemberInfo(int empNo) throws Exception {
		AllDto result = ss.selectOne("hr.getMemberInfoByEmpNo", empNo);
		System.out.println("AllDto :::::" + result);
		return result;
	}

	@Override
	public List<MemberDto> getSearchList(MemberDto memberDto) {
		return ss.selectList("hr.getListBySearch", memberDto);
	}

	@Override
	public List<InsaNoteDto> getInsanote(int empNo) throws Exception {
		System.out.println(empNo);
		return ss.selectList("hr.getInsanote", empNo);
	}

	@Override
	public int insaDel(int delNo) throws Exception {
		return ss.update("hr.insaDel", delNo);
	}

	@Override
	public int addInsaNote(InsaNoteDto dto) throws Exception {
		return ss.insert("hr.addInsaNote", dto);
	}

	

}
