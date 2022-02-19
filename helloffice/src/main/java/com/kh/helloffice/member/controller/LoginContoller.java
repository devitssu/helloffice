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
	
	// 로그인 화면 보여주기
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	// 로그인 로직 처리
	@PostMapping("login")
	public String login(MemberDto dto) {
		
		MemberDto loginUser = service.login(dto);
		
		return "member/login";
	}
}
