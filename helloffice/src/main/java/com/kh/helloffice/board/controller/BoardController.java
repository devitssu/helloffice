package com.kh.helloffice.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.helloffice.board.entity.BoardDto;
import com.kh.helloffice.board.entity.PostDto;
import com.kh.helloffice.board.service.BoardService;

@Controller
@RequestMapping("board/{boardNo}")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping
	public String board(@PathVariable long boardNo) throws Exception {
//		List<BoardDto> list =  service.getList(boardNo);
		return "board/board";
	}

	@GetMapping("{no}")
	public String detail(@PathVariable long no) {
		return "board/post";
	}
	
	@GetMapping("post")
	public String post() {
		return "board/add-post";
	}
	
	
	@PostMapping("post")
	public String post(PostDto post, @PathVariable String boardNo) throws Exception {
		
		System.out.println(post);
		
		int result = service.post(post);
		if(result > 0) {
			return "redirect:/board/" + boardNo;
		}else {
			return "error";
		}
	}
	
	@PutMapping("{no}")
	public String update(@PathVariable long no, PostDto post) {
		return "board/board";
	}
	
	@DeleteMapping("{no}")
	public String delete(@PathVariable long no) {
		return "board/board";
	}

}
