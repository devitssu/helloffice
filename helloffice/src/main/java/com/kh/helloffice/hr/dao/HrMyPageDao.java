package com.kh.helloffice.hr.dao;

import java.util.List;

import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.member.entity.MemberDto;

public interface HrMyPageDao {

	int editInsaPage(MemberDto dto) throws Exception;

	MemberDto getMember(MemberDto dto) throws Exception;

	int editBasicPage(MemberDto dto) throws Exception;

	List<DeptDto> getDeptList() throws Exception;

}
