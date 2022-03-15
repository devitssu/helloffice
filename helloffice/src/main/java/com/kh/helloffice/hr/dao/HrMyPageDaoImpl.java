package com.kh.helloffice.hr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.hr.entity.CareerDto;
import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.member.entity.MemberDto;

@Repository
public class HrMyPageDaoImpl implements HrMyPageDao{
	
	@Autowired
	private SqlSession ss;

	@Override
	public int editInsaPage(MemberDto dto) throws Exception {
		int x = ss.update("hr.editInsaPage", dto);
		System.out.println(x);
		
		return x;
	}

	@Override
	public MemberDto getMember(MemberDto dto) throws Exception {
		MemberDto result =  ss.selectOne("hr.getMember", dto);
		System.out.println(result);
		return result;
	}

	@Override
	public int editBasicPage(MemberDto dto) throws Exception {
		int x = ss.update("hr.editBasicPage", dto);
		System.out.println("dao editBasicPage ::::" + x);
		
		return x;
	}

	@Override
	public List<DeptDto> getDeptList() throws Exception {
		return ss.selectList("hr.getDeptList");
	}

	@Override
	public List<MemberDto> getInsaPageInfo(int empNo) throws Exception {
		return ss.selectList("hr.getInsaPageInfo", empNo);
	}

	@Override
	public List<MemberDto> getBasicPageInfo(int empNo) throws Exception {
		return ss.selectList("hr.getBasicPageInfo", empNo);
	}

	@Override
	public List<CareerDto> getCareerInfo(int empNo) throws Exception {
		return ss.selectList("hr.getCareerInfo",empNo);
	}

}
