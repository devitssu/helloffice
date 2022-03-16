package com.kh.helloffice.hr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.hr.dao.HrMyPageDao;
import com.kh.helloffice.hr.entity.AcademicDto;
import com.kh.helloffice.hr.entity.CareerDto;
import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.member.entity.MemberDto;

@Service
public class HrMyPageServiceImpl implements HrMyPageService{
	
	@Autowired
	private HrMyPageDao dao;
	

	@Override
	public MemberDto editInsaPage(MemberDto dto) throws Exception {
		int result = dao.editInsaPage(dto);
		
		MemberDto updatedMember = null;
		if(result > 0) {
			updatedMember = dao.getMember(dto);
		}
		return updatedMember;
	}


	@Override
	public MemberDto editBasicPage(MemberDto dto) throws Exception {
		int result = dao.editBasicPage(dto);
		
		MemberDto updatedMember = null;
		if(result > 0) {
			updatedMember = dao.getMember(dto);
		}
		return updatedMember;
	}


	@Override
	public List<DeptDto> getDeptList() throws Exception {
		return dao.getDeptList();
	}


	@Override
	public List<MemberDto> getInsaPageInfo(int empNo) throws Exception {
		return dao.getInsaPageInfo(empNo);
	}


	@Override
	public List<MemberDto> getBasicPageInfo(int empNo) throws Exception {
		return dao.getBasicPageInfo(empNo);
	}


	@Override
	public List<CareerDto> getCareerInfo(int empNo) throws Exception {
		return dao.getCareerInfo(empNo);
	}


	@Override
	public CareerDto getMyCareer(long empNo) throws Exception {
		return dao.getMyCareer(empNo);
	}


	@Override
	public AcademicDto getMyAca(long empNo) throws Exception {
		return dao.getMyAca(empNo);
	}


	@Override
	public int createMyCareer(CareerDto dto) throws Exception {
		return dao.createMyCareer(dto);
	}


	@Override
	public AcademicDto udtMyAca(int empNo) throws Exception {
		int result = dao.udtMyAca(empNo);
		
		AcademicDto updatedCr = null;
		if(result > 0) {
			updatedCr = dao.getMyAca(empNo);
		}
		return updatedCr;
	}

	@Override
	public int careerUdt(CareerDto dto) throws Exception {
		return dao.careerUdt(dto);
	}


	@Override
	public int createMyAca(AcademicDto dto) throws Exception {
		return dao.createMyAca(dto);
	}


	@Override
	public int academicUdt(AcademicDto dto) throws Exception {
		return dao.academicUdt(dto);
	}

}
