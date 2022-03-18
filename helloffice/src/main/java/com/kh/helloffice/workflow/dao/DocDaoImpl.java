package com.kh.helloffice.workflow.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.workflow.entity.WfDocDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class DocDaoImpl implements DocDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WfDocDto> selectDocList() throws Exception {
		return sqlSession.selectList("wfDoc.selectDocList");
	}

	@Override
	public int changeImpor(long docTNo) throws Exception {
		return sqlSession.update("wfDoc.changeImpor", docTNo);
	}

	@Override
	public List<WfDocDto> selectEachDoc(long docTNo) throws Exception {
		return sqlSession.selectList("wfDoc.selectEachDoc", docTNo);
	}

	@Override
	public List<WfDocDto> selectDocApp(long docTNo) throws Exception {
		return sqlSession.selectList("wfDoc.selectDocApp", docTNo);
	}

	@Override
	public List<WfDocDto> mySendList(long empNo) throws Exception {
		return sqlSession.selectList("wfDoc.mySendList", empNo);
	}

	@Override
	public List<WfDocDto> myGetList(long empNo) throws Exception {
		return sqlSession.selectList("wfDoc.myGetList", empNo);
	}

	@Override
	public int docApprove(WfDocDto wfDocDto) throws Exception {
		return sqlSession.update("wfDoc.docApprove", wfDocDto);
	}

	@Override
	public int docDecline(WfDocDto wfDocDto) throws Exception {
		return sqlSession.update("wfDoc.docDecline", wfDocDto);
	}
}
