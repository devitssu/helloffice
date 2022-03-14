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

	int insertCus(HashMap<String, Object> map) throws Exception;

//	int insertCon(HashMap<String, Object> map) throws Exception;
//
//	int insertFile(Map<String, Object> cusFile) throws Exception;

	List<WfFormDto> selectEachForm(String formName) throws Exception;



}
