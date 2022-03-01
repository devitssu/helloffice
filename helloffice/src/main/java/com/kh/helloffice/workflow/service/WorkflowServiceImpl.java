package com.kh.helloffice.workflow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.workflow.dao.WorkflowDao;
import com.kh.helloffice.workflow.entity.TagDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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

	@Override
	public int deleteTag(String targetName) throws Exception {
		return dao.deleteTag(targetName);
	}

	@Override
	public TagDto selectTagOne(String targetName) throws Exception {
		return dao.selectTagOne(targetName);
	}
	
	@Override
	public int updateTag(TagDto tagDto) throws Exception {
		int s = dao.updateTag(tagDto);
		log.info("서비스임플 :: "+s);
		return s;
	}


}
