package com.kh.helloffice.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.board.entity.BoardDto;
import com.kh.helloffice.board.entity.PostDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<BoardDto> getList(long boardNo) throws Exception {
		return session.selectList("board.getPostList", boardNo);
	}

	@Override
	public int post(PostDto post) throws Exception {
		return session.insert("board.insertPost", post);
	}

}
