package com.kh.helloffice.hr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.member.entity.MemberDto;

@Repository
public class HrDaoImpl implements HrDao{
	
	@Autowired
	public SqlSession ss;

	@Override
	public List<MemberDto> getTeamList(MemberDto dto) throws Exception {
		return ss.selectList("hr.getTeamList", dto);
	}

}
