package com.kh.helloffice.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.board.dao.BoardDao;
import com.kh.helloffice.board.entity.BoardDto;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardDto> getList(long boardNo) throws Exception {
		return dao.getList(boardNo);
	}

}
