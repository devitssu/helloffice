package com.kh.helloffice.member.dao;

import com.kh.helloffice.member.entity.MemberDto;

public interface MemberDao {

	MemberDto getMember(MemberDto dto);
	
	int emailCheck(String email);

}
