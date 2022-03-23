package com.kh.helloffice.workflow.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.workflow.dao.WorkflowDao;
import com.kh.helloffice.workflow.entity.TagDto;
import com.kh.helloffice.workflow.entity.WfFormDto;

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
	public int deleteTag(String tagName) throws Exception {
		return dao.deleteTag(tagName);
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

	@Override
	public int countTagName(String targetName) throws Exception {
		return dao.countTagName(targetName);
	}

	@Override
	public List<WfFormDto> selectWfFormList() throws Exception {
		return dao.selectWfFormList();
		
	}

	@Override
	public int insertForm(HashMap<String, Object> map) throws Exception {
		return dao.insertForm(map);
	}

	@Override
	public List<WfFormDto> selectFormByTag(String tagNo) throws Exception {
		return dao.selectFormByTag(tagNo);
	}

	@Override
	public int deleteForm(String formNo) throws Exception {
		return dao.deleteForm(formNo);
	}

	@Override
	public int insertCon(HashMap<String, Object> map) throws Exception {
		return dao.insertCon(map);
	}

	@Override
	public int insertCus(HashMap<String, Object> map) throws Exception {
		return dao.insertCus(map);
	}

	@Override
	public int insertApp(HashMap<String, Object> map) throws Exception {
		return dao.insertApp(map);
	}

	@Override
	public List<WfFormDto> selectEachForm(String formNo) throws Exception {
		return dao.selectEachForm(formNo);
	}

	@Override
	public List<WfFormDto> selectEachStep(String formNo) throws Exception {
		return dao.selectEachStep(formNo);
	}

	@Override
	public int insertDoc(HashMap<String, Object> map) throws Exception {
		return dao.insertDoc(map);
	}

	@Override
	public int insertDocCus(HashMap<String, Object> map) throws Exception {
		return dao.insertDocCus(map);
	}

	@Override
	public int insertDocApp(HashMap<String, Object> map) throws Exception {
		return dao.insertDocApp(map);
	}

	@Override
	public int insertDocCon(HashMap<String, Object> map) throws Exception {
		return dao.insertDocCon(map);
	}





}
