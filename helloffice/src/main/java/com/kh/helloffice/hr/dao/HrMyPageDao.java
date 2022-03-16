package com.kh.helloffice.hr.dao;

import java.util.List;

import com.kh.helloffice.hr.entity.AcademicDto;
import com.kh.helloffice.hr.entity.CareerDto;
import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.member.entity.MemberDto;

public interface HrMyPageDao {

	int editInsaPage(MemberDto dto) throws Exception;

	MemberDto getMember(MemberDto dto) throws Exception;

	int editBasicPage(MemberDto dto) throws Exception;

	List<DeptDto> getDeptList() throws Exception;

	List<MemberDto> getInsaPageInfo(int empNo) throws Exception;

	List<MemberDto> getBasicPageInfo(int empNo) throws Exception;

	List<CareerDto> getCareerInfo(int empNo) throws Exception;

	CareerDto getMyCareer(long empNo) throws Exception;

	AcademicDto getMyAca(long empNo) throws Exception;

	int createMyCareer(CareerDto dto) throws Exception;

	int udtMyAca(int empNo) throws Exception;

	int careerUdt(CareerDto dto) throws Exception;

	int createMyAca(AcademicDto dto) throws Exception;

	int academicUdt(AcademicDto dto) throws Exception;

}
