package com.kh.helloffice.hr.dao;

import java.util.List;

import com.kh.helloffice.member.entity.MemberDto;

public interface HrDao {

	List<MemberDto> getTeamList() throws Exception;

}
