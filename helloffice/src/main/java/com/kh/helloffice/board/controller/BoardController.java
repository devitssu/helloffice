package com.kh.helloffice.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.helloffice.board.entity.PageVo;
import com.kh.helloffice.board.entity.PostDto;
import com.kh.helloffice.board.service.BoardService;

@Controller
@RequestMapping("board/{boardNo}")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping
	public String board(@PathVariable long boardNo, 
						@RequestParam(defaultValue = "전체") String category, 
						@RequestParam(defaultValue = "") String search, 
						@RequestParam(defaultValue = "1") String page, 
						@RequestParam(defaultValue = "10") String count, 
						Model model) throws Exception {
		int pageNum = 5;
		int totalRow = service.getTotalPostNum(boardNo);
		
		PageVo pageVo = new PageVo(page, count, pageNum, totalRow);
		pageVo.setBoardNo(boardNo);
		pageVo.setCategory(category);
		pageVo.setSearch(search);
		
		List<PostDto> list =  service.getList(pageVo, category);
		
		model.addAttribute("page", pageVo);
		model.addAttribute("list", list);
		return "board/board";
	}

	@GetMapping("{no}")
	public String detail(@PathVariable long no, @PathVariable long boardNo, Model model) throws Exception {
		PostDto post = service.getPost(no);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("post", post);
		return "board/post";
	}
	
	@GetMapping("post")
	public String post() {
		return "board/add-post";
	}
	
	
	@PostMapping("post")
	public String post(PostDto post, @PathVariable String boardNo) throws Exception {
		
		int result = service.post(post);
		
		if(result > 0) {
			return "redirect:/board/" + boardNo;
		}else {
			return "error";
		}
	}
	
	@GetMapping("post/{no}")
	public String editPost(@PathVariable long no, Model model) throws Exception {
		PostDto post = service.getPost(no);
		model.addAttribute("post", post);
		return "board/edit-post";
	}
	
	@PutMapping("post/{no}")
	public String update(@PathVariable String boardNo, 
						 @PathVariable long no, 
						 PostDto post) throws Exception {
		int result = service.editPost(post);
		if(result > 0) {
			return "redirect:/board/" + boardNo + "/" + no;			
		}else {
			return "redirect:/board/" + boardNo + "/post/" + no;
		}
	}
	
	@DeleteMapping("{no}")
	public String delete(@PathVariable String boardNo, @PathVariable long no) throws Exception {
		int result = service.deletePost(no);
		if(result > 0) {			
			return "redirect:/board/" + boardNo;
		}else {
			return "redirect:/board/" + boardNo + "/" + no;		
		}
	}

}
