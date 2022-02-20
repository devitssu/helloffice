package com.kh.helloffice.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@GetMapping
	public String board() {
		return "board/board";
	}
	
	@GetMapping("write")
	public String write() {
		return "board/add-board";
	}

}
