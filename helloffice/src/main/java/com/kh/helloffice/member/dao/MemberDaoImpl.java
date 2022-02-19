package com.kh.helloffice.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.member.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession ss;

	@Override
	public MemberDto getMember(MemberDto dto) {
		
		return ss.selectOne("member.getMemeber", dto);
	}

}
