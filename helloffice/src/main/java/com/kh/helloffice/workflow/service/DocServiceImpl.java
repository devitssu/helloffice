package com.kh.helloffice.workflow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.workflow.dao.DocDao;
import com.kh.helloffice.workflow.entity.WfDocDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DocServiceImpl implements DocService {
	
	@Autowired
	private DocDao dao;
	
	@Override
	public List<WfDocDto> selectDocList() throws Exception {
		return dao.selectDocList();
	}

	@Override
	public int changeImpor(long docTNo) throws Exception {
		return dao.changeImpor(docTNo);
	}

	@Override
	public List<WfDocDto> selectEachDoc(long docTNo) throws Exception {
		return dao.selectEachDoc(docTNo);
	}

	@Override
	public List<WfDocDto> selectDocApp(long docTNo) throws Exception {
		return dao.selectDocApp(docTNo);
	}

	@Override
	public List<WfDocDto> mySendList(long empNo) throws Exception {
		return dao.mySendList(empNo);
	}

	@Override
	public List<WfDocDto> myGetList(long empNo) throws Exception {
		return dao.myGetList(empNo);
	}

	@Override
	public int docApprove(WfDocDto wfDocDto) throws Exception {
		return dao.docApprove(wfDocDto);
	}

	@Override
	public int docDecline(WfDocDto wfDocDto) throws Exception {
		return dao.docDecline(wfDocDto);
	}

}
