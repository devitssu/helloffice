package com.kh.helloffice.workflow.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.workflow.entity.TagDto;

@Repository
public class WorkflowDaoImpl implements WorkflowDao{

	@Autowired SqlSession sqlSession;
	
	@Override
	public int insertTag(TagDto tagDto) throws Exception {
		return sqlSession.insert("workflow.insertTag", tagDto);
	}

	@Override
	public List<TagDto> selectTagList() throws Exception {
		return sqlSession.selectList("workflow.selectTagList");
	}

}
