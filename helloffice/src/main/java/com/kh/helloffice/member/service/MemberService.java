package com.kh.helloffice.member.service;

import com.kh.helloffice.member.entity.MemberDto;

public interface MemberService {

	MemberDto login(MemberDto dto); 
	
	int emailCheck(String email);
}
