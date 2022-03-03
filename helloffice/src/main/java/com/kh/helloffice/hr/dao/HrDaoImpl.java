package com.kh.helloffice.hr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.hr.entity.PageVo;
import com.kh.helloffice.member.entity.MemberDto;

@Repository
public class HrDaoImpl implements HrDao{
	
	@Autowired
	public SqlSession ss;

	@Override
	public List<MemberDto> getTeamList() throws Exception {
		return ss.selectList("hr.getTeamList");
	}

	@Override
	public List<MemberDto> getRepTeamList() throws Exception{
		return ss.selectList("hr.getRepTeamList");
	}

	@Override
	public List<MemberDto> getMarkTeamList() throws Exception {
		return ss.selectList("hr.getMarkTeamList");
	}

	@Override
	public List<MemberDto> getSalesTeamList() throws Exception {
		return ss.selectList("hr.getSalesTeamList");
	}

	@Override
	public List<MemberDto> getDesignTeamList() throws Exception {
		return ss.selectList("hr.getDesignTeamList");
	}

	@Override
	public List<DeptDto> getDeptList() throws Exception {
		return ss.selectList("hr.getDeptList");
	}

	@Override
	public int getDeptCnt() throws Exception {
		return ss.selectOne("hr.getDeptCnt");
	}

	@Override
	public int cntDepName(String depName) throws Exception {
		return ss.selectOne("hr.cntDepName", depName);
	}

	@Override
	public int insertDept(DeptDto deptDto) throws Exception {
		return ss.insert("hr.insertDept", deptDto);
	}

}
