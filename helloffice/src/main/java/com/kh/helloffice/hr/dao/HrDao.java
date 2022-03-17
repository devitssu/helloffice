package com.kh.helloffice.hr.dao;

import java.util.List;

import com.kh.helloffice.hr.entity.AllDto;
import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.hr.entity.InsaNoteDto;
import com.kh.helloffice.member.entity.MemberDto;

public interface HrDao {

	List<MemberDto> getTeamList() throws Exception;

	List<DeptDto> getDeptList() throws Exception;

	int getDeptCnt() throws Exception;

	int cntDepName(String depName) throws Exception;

	int insertDept(DeptDto deptDto) throws Exception;

	int updDeptName(DeptDto deptDto) throws Exception;

	int delDeptName(String depName) throws Exception;

	List<MemberDto> getMemberListByDept(String deptName) throws Exception;

	List<MemberDto> getMyTeamList(String depName) throws Exception;

	AllDto getMemberInfo(int empNo) throws Exception;

	List<MemberDto> getSearchList(MemberDto memberDto);

	List<InsaNoteDto> getInsanote(int empNo) throws Exception;

	int insaDel(int delNo) throws Exception;

	int addInsaNote(InsaNoteDto dto) throws Exception;

}
