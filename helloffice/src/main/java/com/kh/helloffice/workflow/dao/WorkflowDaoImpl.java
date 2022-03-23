package com.kh.helloffice.workflow.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.workflow.entity.TagDto;
import com.kh.helloffice.workflow.entity.WfFormDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class WorkflowDaoImpl implements WorkflowDao{

	@Autowired 
	private SqlSession sqlSession;
	
	@Override
	public int insertTag(TagDto tagDto) throws Exception {
		return sqlSession.insert("workflow.insertTag", tagDto);
	}

	@Override
	public List<TagDto> selectTagList() throws Exception {
//		List<TagDto> a = sqlSession.selectList("workflow.selectTagList");
//		log.info(a.toString());
		return sqlSession.selectList("workflow.selectTagList");
	}

	@Override
	public int deleteTag(String tagName) throws Exception {
		return sqlSession.update("workflow.deleteTag", tagName);
	}

	@Override
	public TagDto selectTagOne(String targetName) throws Exception {
		return sqlSession.selectOne("workflow.selectTagOne", targetName);
	}

	@Override
	public int updateTag(TagDto tagDto) throws Exception {
		int s = sqlSession.update("workflow.updateTag", tagDto);
		log.info("dao임플 :: "+s);
		return s;
	}

	@Override
	public int countTagName(String targetName) throws Exception {
		return sqlSession.selectOne("workflow.countTagName", targetName);
	}

	@Override
	public List<WfFormDto> selectWfFormList() throws Exception {
		return sqlSession.selectList("workflow.selectWfFormList");
	}

	@Override
	public int insertForm(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert("workflow.insertForm", map);
	}

	@Override
	public List<WfFormDto> selectFormByTag(String tagNo) throws Exception {
		return sqlSession.selectList("workflow.selectFormByTag", Integer.valueOf(tagNo));
	}

	@Override
	public int deleteForm(String formNo) throws Exception {
		return sqlSession.delete("workflow.deleteForm", Integer.valueOf(formNo));
	}

	@Override
	public int insertCon(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert("workflow.insertCon", map);
	}

	@Override
	public int insertCus(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert("workflow.insertCus", map);
	}

	@Override
	public int insertApp(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert("workflow.insertApp", map);
	}

	@Override
	public List<WfFormDto> selectEachForm(String formNo) throws Exception {
		return sqlSession.selectList("workflow.selectEachForm", Integer.valueOf(formNo));
	}

	@Override
	public List<WfFormDto> selectEachStep(String formNo) throws Exception {
		return sqlSession.selectList("workflow.selectEachStep", Integer.valueOf(formNo));
	}
	
//	문서

	@Override
	public int insertDoc(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert("workflow.insertDoc", map);
	}

	@Override
	public int insertDocCon(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert("workflow.insertDocCon", map);
	}

	@Override
	public int insertDocCus(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert("workflow.insertDocCus", map);
	}

	@Override
	public int insertDocApp(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert("workflow.insertDocApp", map);
	}







}
