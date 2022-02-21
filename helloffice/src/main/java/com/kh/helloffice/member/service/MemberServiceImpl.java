package com.kh.helloffice.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.helloffice.member.dao.MemberDao;
import com.kh.helloffice.member.entity.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private PasswordEncoder pe;

	@Override
	public MemberDto login(MemberDto dto) {
		
		// db에서 회원 정보 조회
		MemberDto dbUser = dao.getMember(dto);
		
		// 비번 맞나 체크
		if(pe.matches(dto.getUserPwd(), dbUser.getUserPwd())) {
			// 로그인
			return dbUser;
		} else {
			
			return null;
		}
	}

}
