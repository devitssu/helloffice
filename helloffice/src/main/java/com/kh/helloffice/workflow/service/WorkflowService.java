package com.kh.helloffice.workflow.service;

import java.util.List;

import com.kh.helloffice.workflow.entity.TagDto;

public interface WorkflowService {

	int insertTag(TagDto tagDto) throws Exception;

	List<TagDto> selectTagList() throws Exception;

	int deleteTag(String targetName) throws Exception;

	TagDto selectTagOne(String targetName) throws Exception;

	int updateTag(TagDto tagDto) throws Exception;


}
