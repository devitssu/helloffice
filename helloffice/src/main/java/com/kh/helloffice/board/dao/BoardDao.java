package com.kh.helloffice.board.dao;

import java.util.List;

import com.kh.helloffice.board.entity.PostDto;

public interface BoardDao {

	List<PostDto> getList(long boardNo) throws Exception;

	int post(PostDto post) throws Exception;

	PostDto getPost(long no) throws Exception;

	int editPost(PostDto post) throws Exception;

	int deletePost(long no) throws Exception;

}
