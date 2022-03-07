package com.kh.helloffice.hr.dao;

import java.util.List;

import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.member.entity.MemberDto;

public interface HrDao {

	List<MemberDto> getTeamList() throws Exception;

	List<MemberDto> getRepTeamList() throws Exception;

	List<MemberDto> getMarkTeamList() throws Exception;

	List<MemberDto> getSalesTeamList() throws Exception;

	List<MemberDto> getDesignTeamList() throws Exception;

	List<DeptDto> getDeptList() throws Exception;

	int getDeptCnt() throws Exception;

	int cntDepName(String depName) throws Exception;

	int insertDept(DeptDto deptDto) throws Exception;

	int updDeptName(DeptDto deptDto) throws Exception;

	int delDeptName(String depName) throws Exception;

	List<MemberDto> getMemberListByDept(String deptName) throws Exception;

}
