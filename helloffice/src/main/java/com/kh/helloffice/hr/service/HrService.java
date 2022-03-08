package com.kh.helloffice.hr.service;

import java.util.List;

import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.hr.entity.PageVo;
import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.reservation.entity.AssetDto;

public interface HrService {

	List<MemberDto> getTeamList() throws Exception;

	List<DeptDto> getDeptList() throws Exception;

	int cntDepName(String depName) throws Exception;

	int insertDept(DeptDto deptDto) throws Exception;

	int updDeptName(DeptDto deptDto) throws Exception;

	int delDeptName(String depName) throws Exception;

	List<MemberDto> getMemberListByDept(String deptName) throws Exception;


}
