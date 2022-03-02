package com.kh.helloffice.hr.service;

import java.util.List;

import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.reservation.entity.AssetDto;

public interface HrService {

	List<MemberDto> getTeamList() throws Exception;

}
