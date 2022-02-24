package com.kh.helloffice.member.service;

import com.kh.helloffice.member.entity.MemberDto;

public interface MemberService {

	MemberDto login(MemberDto dto) throws Exception; 
	
	int emailCheck(String email) throws Exception;

	int join(MemberDto dto) throws Exception;
}
