package com.kh.helloffice.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("workMember")
public class WorkMemberController {

	@GetMapping
	public String workMember() {
		return "work/workMember";
	}
}
