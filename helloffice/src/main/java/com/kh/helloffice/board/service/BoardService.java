package com.kh.helloffice.board.service;

import java.util.List;

import com.kh.helloffice.board.entity.PostDto;

public interface BoardService {

	List<PostDto> getList(long boardNo) throws Exception;

	int post(PostDto post) throws Exception;

	PostDto getPost(long no) throws Exception;

}
