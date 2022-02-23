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
		
		MemberDto dbEmp = dao.getMember(dto);
		
		if(dto.getEmpPwd().equals( dbEmp.getEmpPwd())) {
			return dbEmp;
		} else {
			System.out.println("null service");
			return null;
		}
	}

	@Override
	public int emailCheck(String email) {
		
		return dao.emailCheck(email);
	}

}
