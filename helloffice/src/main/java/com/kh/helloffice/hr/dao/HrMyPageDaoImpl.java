package com.kh.helloffice.hr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.hr.entity.AcademicDto;
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

	@Override
	public CareerDto getMyCareer(long empNo) throws Exception {
		return ss.selectOne("hr.getMyCareer", empNo);
	}

	@Override
	public AcademicDto getMyAca(long empNo) throws Exception {
		System.out.println(empNo);
		AcademicDto result = ss.selectOne("hr.getMyAca", empNo);
		System.out.println(result);
		return result;
		
	}

	@Override
	public int createMyCareer(CareerDto dto) throws Exception {
		return ss.insert("hr.createMyCareer", dto);
	}

	@Override
	public int udtMyAca(int empNo) throws Exception {
		return ss.update("hr.udtMyAca", empNo);
	}

	@Override
	public int careerUdt(CareerDto dto) throws Exception {
		return ss.update("hr.careerUdt", dto);
	}

	@Override
	public int createMyAca(AcademicDto dto) throws Exception {
		return ss.insert("hr.createMyAca", dto);
	}

	@Override
	public int academicUdt(AcademicDto dto) throws Exception {
		return ss.update("hr.academicUdt", dto);
	}

}
