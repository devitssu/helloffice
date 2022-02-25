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
	public MemberDto getMember(MemberDto dto) throws Exception {
		return ss.selectOne("member.getMember", dto);
	}

	@Override
	public int emailCheck(String email) throws Exception{
		return ss.selectOne("member.emailCheck", email);
	}

	@Override
	public int getMemberSeq() throws Exception{
		return ss.selectOne("member.getSeq");
	}

	@Override
	public int insertMember(MemberDto dto) throws Exception{
		return ss.insert("member.insertMember", dto);
	}

	@Override
	public void insertProfile(MemberDto dto) throws Exception {
		ss.insert("member.insertProfile", dto);
	}

}
