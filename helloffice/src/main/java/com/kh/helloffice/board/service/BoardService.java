package com.kh.helloffice.board.service;

import java.util.List;

import com.kh.helloffice.board.entity.PageVo;
import com.kh.helloffice.board.entity.PostDto;

public interface BoardService {

	List<PostDto> getList(PageVo pageVo, String category) throws Exception;

	int post(PostDto post) throws Exception;

	PostDto getPost(long no) throws Exception;

	int editPost(PostDto post) throws Exception;

	int deletePost(long no) throws Exception;

	int getTotalPostNum(long boardNo) throws Exception;

	List<PostDto> getRecentList() throws Exception;

}
