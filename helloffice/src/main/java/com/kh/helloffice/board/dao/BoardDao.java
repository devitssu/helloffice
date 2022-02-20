package com.kh.helloffice.board.dao;

import java.util.List;

import com.kh.helloffice.board.entity.BoardDto;

public interface BoardDao {

	List<BoardDto> getList(long boardNo) throws Exception;

}
