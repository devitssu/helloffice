package com.kh.helloffice.board.dao;

import java.util.List;

import com.kh.helloffice.board.entity.PageVo;
import com.kh.helloffice.board.entity.PostDto;

public interface BoardDao {

	List<PostDto> getList(PageVo pageVo) throws Exception;

	int post(PostDto post) throws Exception;

	PostDto getPost(long no) throws Exception;

	int editPost(PostDto post) throws Exception;

	int deletePost(long no) throws Exception;

	int getTotalPostNum(long boardNo) throws Exception;

	List<PostDto> getRecentList() throws Exception;

}
