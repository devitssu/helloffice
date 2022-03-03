package com.kh.helloffice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.helloffice.board.entity.PostDto;
import com.kh.helloffice.board.service.BoardService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private BoardService service;

	@GetMapping()
	public String main(Model model) throws Exception {
		List<PostDto> notices = service.getRecentList();
		model.addAttribute("notices", notices);
		return "main";
	}
	
}
