package com.kh.helloffice.workflow.service;

import java.util.List;

import com.kh.helloffice.workflow.entity.WfDocDto;

public interface DocService {

	List<WfDocDto> selectDocList() throws Exception;

	int changeImpor(long docTNo) throws Exception;

	List<WfDocDto> selectEachDoc(long docTNo) throws Exception;

	List<WfDocDto> selectDocApp(long docTNo) throws Exception;

}
