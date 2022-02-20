package com.kh.helloffice.board.dao;

import java.util.List;

import com.kh.helloffice.board.entity.BoardDto;
import com.kh.helloffice.board.entity.PostDto;

public interface BoardDao {

	List<BoardDto> getList(long boardNo) throws Exception;

	int post(PostDto post) throws Exception;

}
