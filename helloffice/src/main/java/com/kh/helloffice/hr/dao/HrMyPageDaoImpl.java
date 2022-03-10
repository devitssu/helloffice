package com.kh.helloffice.hr.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.member.entity.MemberDto;

@Repository
public class HrMyPageDaoImpl implements HrMyPageDao{
	
	@Autowired
	private SqlSession ss;

	@Override
	public int editInsaPage(MemberDto dto) throws Exception {
		return ss.update("hr.editInsaPage", dto);
	}

	@Override
	public MemberDto getMember(MemberDto dto) throws Exception {
		return ss.selectOne("member.getMember", dto);
	}

}
