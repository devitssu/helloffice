package com.kh.helloffice.hr.service;

import java.util.List;

import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.member.entity.MemberDto;

public interface HrMyPageService {

	MemberDto editInsaPage(MemberDto dto) throws Exception;

	MemberDto editBasicPage(MemberDto dto) throws Exception;

	List<DeptDto> getDeptList() throws Exception;

	

}
