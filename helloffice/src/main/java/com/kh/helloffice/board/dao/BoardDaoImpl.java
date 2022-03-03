package com.kh.helloffice.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.board.entity.PageVo;
import com.kh.helloffice.board.entity.PostDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<PostDto> getList(PageVo pageVo) throws Exception {
		return session.selectList("board.getPostList", pageVo);
	}

	@Override
	public int post(PostDto post) throws Exception {
		return session.insert("board.insertPost", post);
	}

	@Override
	public PostDto getPost(long no) throws Exception {
		return session.selectOne("board.getPost", no);
	}

	@Override
	public int editPost(PostDto post) throws Exception {
		return session.update("board.updatePost", post);
	}

	@Override
	public int deletePost(long no) throws Exception {
		return session.delete("board.deletePost", no);
	}

	@Override
	public int getTotalPostNum(long boardNo) throws Exception {
		return session.selectOne("board.getTotalPostNum", boardNo);
	}

	@Override
	public List<PostDto> getRecentList() throws Exception {
		return session.selectList("board.getRecentList");
	}

}
