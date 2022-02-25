package com.kh.helloffice.hr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("hr")
public class HrController {
	
	@GetMapping("teamList")
	public String main() {
		return "hr/teamList";
	}

	
}
