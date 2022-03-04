package com.kh.helloffice.workflow.service;

import java.util.List;

import com.kh.helloffice.workflow.entity.TagDto;
import com.kh.helloffice.workflow.entity.WfFormDto;

public interface WorkflowService {

//	태그 관련
	
	int insertTag(TagDto tagDto) throws Exception;

	List<TagDto> selectTagList() throws Exception;

	int deleteTag(String tagName) throws Exception;

	TagDto selectTagOne(String targetName) throws Exception;

	int updateTag(TagDto tagDto) throws Exception;

	int countTagName(String targetName) throws Exception;
	
//	양식 관련

	List<WfFormDto> selectWfFormList() throws Exception;

	int insertForm(WfFormDto wfFormDto) throws Exception;

	List<WfFormDto> selectFormByTag(String tagNo) throws Exception;

	int deleteForm(String formName) throws Exception;


}
