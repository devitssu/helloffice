package com.kh.helloffice.workflow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.workflow.dao.WorkflowDao;
import com.kh.helloffice.workflow.entity.TagDto;

@Service
public class WorkflowServiceImpl implements WorkflowService{

	@Autowired
	private WorkflowDao dao;
	
	@Override
	public int insertTag(TagDto tagDto) throws Exception {
		return dao.insertTag(tagDto);
	}

	@Override
	public List<TagDto> selectTagList() throws Exception {
		return dao.selectTagList();
	}

}
