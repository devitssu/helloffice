package com.kh.helloffice.member.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberContoller {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("login")
	public String login(MemberDto dto, HttpSession session) throws Exception {
		MemberDto loginEmp = service.login(dto);
		
		if(loginEmp != null) {
			session.setAttribute("loginEmp", loginEmp);
			return "redirect:/";
		} else {
			System.out.println("null controller");
			return "member/join";
		}
	}
	
	@GetMapping("join")
	public String join(String empRank, Model model) {
		model.addAttribute("empRank", empRank);
		return "member/join";
	}
	
	@PostMapping("join")
	public String join(MemberDto dto) throws Exception {
		
		System.out.println(dto);
		
		int result = service.join(dto);
		
		return "redirect:/member/login";
	}
	
	@PostMapping("emailCheck")
	@ResponseBody
	public int emailCheck(String email) throws Exception {
		
		return service.emailCheck(email);
	}
	
	@PostMapping("")
	public String emailCheck(MemberDto dto, String email) throws Exception {
		int emailResult = service.emailCheck(email);
		
		if (emailResult == 1) {
			return "/member/join";
		} else if (emailResult == 0) {
			return "redirect:/member/login";
		}
		
		return "redirect:/";
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest request) throws Exception{
		
		HttpSession hsession = request.getSession();
		
		hsession.invalidate();
		
		return "redirect:/";
	}
}
