package com.kh.helloffice.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.board.dao.BoardDao;
import com.kh.helloffice.board.entity.PageVo;
import com.kh.helloffice.board.entity.PostDto;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<PostDto> getList(PageVo pageVo) throws Exception {
		return dao.getList(pageVo);
	}

	@Override
	public int post(PostDto post) throws Exception {
		return dao.post(post);
	}

	@Override
	public PostDto getPost(long no) throws Exception {
		return dao.getPost(no);
	}

	@Override
	public int editPost(PostDto post) throws Exception {
		return dao.editPost(post);
	}

	@Override
	public int deletePost(long no) throws Exception {
		return dao.deletePost(no);
	}

	@Override
	public int getTotalPostNum(long boardNo) throws Exception {
		return dao.getTotalPostNum(boardNo);
	}

}
