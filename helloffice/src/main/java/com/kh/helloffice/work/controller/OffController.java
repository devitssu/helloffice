package com.kh.helloffice.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class OffController {

	@GetMapping("off")
	public String off() {
		return "work/off";
	}
	
	@GetMapping("adminOff")
	public String adminOff() {
		
		return "work/adminOff";
	}
	
	@GetMapping("useDoOff")
	public String useDoOff() {
		
		return "work/useDoOff";
	}
	
	@GetMapping("offPayBack")
	public String offPayBack() {
		
		return "work/offPayBack";
	}
}
