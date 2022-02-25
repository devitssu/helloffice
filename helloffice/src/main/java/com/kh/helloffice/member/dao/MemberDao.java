package com.kh.helloffice.member.dao;

import com.kh.helloffice.member.entity.MemberDto;

public interface MemberDao {

	MemberDto getMember(MemberDto dto) throws Exception;
	
	int emailCheck(String email) throws Exception;

	int getMemberSeq() throws Exception;

	int insertMember(MemberDto dto) throws Exception;

	void insertProfile(MemberDto dto) throws Exception;

}
