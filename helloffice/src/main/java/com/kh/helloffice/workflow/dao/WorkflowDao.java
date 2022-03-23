package com.kh.helloffice.workflow.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.helloffice.workflow.entity.TagDto;
import com.kh.helloffice.workflow.entity.WfFormDto;

public interface WorkflowDao {

	int insertTag(TagDto tagDto) throws Exception;

	List<TagDto> selectTagList() throws Exception;

	int deleteTag(String tagName) throws Exception;

	TagDto selectTagOne(String targetName) throws Exception;

	int updateTag(TagDto tagDto) throws Exception;

	int countTagName(String targetName) throws Exception;

	List<WfFormDto> selectWfFormList() throws Exception;

//	int insertForm(WfFormDto wfFormDto) throws Exception;
	int insertForm(HashMap<String, Object> map) throws Exception;

	List<WfFormDto> selectFormByTag(String tagNo) throws Exception;

	int deleteForm(String formName) throws Exception;

	int insertCon(HashMap<String, Object> map) throws Exception;

	int insertCus(HashMap<String, Object> map) throws Exception;

	int insertApp(HashMap<String, Object> map) throws Exception;

	List<WfFormDto> selectEachForm(String formNo) throws Exception;

	List<WfFormDto> selectEachStep(String formNo) throws Exception;

	int insertDoc(HashMap<String, Object> map) throws Exception;

	int insertDocCon(HashMap<String, Object> map) throws Exception;
	
	int insertDocCus(HashMap<String, Object> map) throws Exception;

	int insertDocApp(HashMap<String, Object> map) throws Exception;






}
