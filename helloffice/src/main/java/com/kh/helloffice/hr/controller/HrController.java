package com.kh.helloffice.hr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("hr")
public class HrController {
	
	@GetMapping("teamList")
	public String teamList() {
		return "hr/teamList";
	}
	
	
	@GetMapping("teamReport")
	public String teamReport() {
		return "hr/teamReport";
	}
	
	
	@GetMapping("invite")
	public String invite() {
		return "hr/invite";
	}
	
	
	@GetMapping("contract")
	public String contract() {
		return "hr/contract";
	}

	
	@GetMapping("sendingInvite")
	public String sendingInvite() {
		return "hr/sendingInvite";
	}

	
}
