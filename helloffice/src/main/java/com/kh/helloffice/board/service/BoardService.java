package com.kh.helloffice.board.service;

import java.util.List;

import com.kh.helloffice.board.entity.BoardDto;

public interface BoardService {

	List<BoardDto> getList(long boardNo) throws Exception;

}
