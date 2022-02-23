package com.kh.helloffice.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.member.service.MemberService;

@Controller
@RequestMapping("member")
public class LoginContoller {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("login")
	public String login(MemberDto dto, HttpSession session) {
		
		MemberDto loginUser = service.login(dto);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
			
		} else {
			System.out.println("null controller");
			return "member/login";
		}
		
		
	}
}
