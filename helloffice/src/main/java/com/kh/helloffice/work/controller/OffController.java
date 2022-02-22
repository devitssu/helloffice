package com.kh.helloffice.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("off")
public class OffController {

	@GetMapping
	public String off() {
		return "work/off";
	}
	
}
