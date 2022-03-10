package com.kh.helloffice.hr.dao;

import com.kh.helloffice.member.entity.MemberDto;

public interface HrMyPageDao {

	int editInsaPage(MemberDto dto) throws Exception;

	MemberDto getMember(MemberDto dto) throws Exception;

}
