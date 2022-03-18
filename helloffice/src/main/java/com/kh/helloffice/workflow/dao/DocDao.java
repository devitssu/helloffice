package com.kh.helloffice.workflow.dao;

import java.util.List;

import com.kh.helloffice.workflow.entity.WfDocDto;

public interface DocDao {

	List<WfDocDto> selectDocList() throws Exception;

	int changeImpor(long docTNo) throws Exception;

	List<WfDocDto> selectEachDoc(long docTNo) throws Exception;

	List<WfDocDto> selectDocApp(long docTNo) throws Exception;

	List<WfDocDto> mySendList(long empNo) throws Exception;

	List<WfDocDto> myGetList(long empNo) throws Exception;

	int docApprove(WfDocDto wfDocDto) throws Exception;

	int docDecline(WfDocDto wfDocDto) throws Exception;

}
