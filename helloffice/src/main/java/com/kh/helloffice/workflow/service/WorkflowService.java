package com.kh.helloffice.workflow.service;

import java.util.List;

import com.kh.helloffice.workflow.entity.TagDto;

public interface WorkflowService {

	int insertTag(TagDto tagDto) throws Exception;

	List<TagDto> selectTagList() throws Exception;

}
