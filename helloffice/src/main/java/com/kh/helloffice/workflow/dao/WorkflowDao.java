package com.kh.helloffice.workflow.dao;

import java.util.List;

import com.kh.helloffice.workflow.entity.TagDto;

public interface WorkflowDao {

	int insertTag(TagDto tagDto) throws Exception;

	List<TagDto> selectTagList() throws Exception;

}
