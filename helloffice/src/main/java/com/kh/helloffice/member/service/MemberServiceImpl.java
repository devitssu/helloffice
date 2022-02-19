package com.kh.helloffice.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.member.dao.MemberDao;
import com.kh.helloffice.member.entity.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao dao;

	@Override
	public MemberDto login(MemberDto dto) {
		
		// db에서 회원 정보 조회
		MemberDto dbUser = dao.getMember(dto);
		
		// 비번 맞나 체크
		dbUser.getUserPwd();
		
		// 비번 맞으면 멤버 리턴
		
		// 틀리면 null 리턴
		
		return null;
	}

}
