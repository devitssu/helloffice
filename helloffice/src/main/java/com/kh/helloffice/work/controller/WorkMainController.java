package com.kh.helloffice.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("workMain")
public class WorkMainController {

	@GetMapping
	public String workMain() {
		return "work/workMain";
	}
	
	
}
