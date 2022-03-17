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
			return "member/login";
		}
	}
	
	@GetMapping("join")
	public String join(Model model, String empName, String email, String empRank, int adminLevel, String empPosition, String depName, int depNo) {
		model.addAttribute("empName", empName);
		model.addAttribute("email", email);
		model.addAttribute("empRank", empRank);
		model.addAttribute("empPosition", empPosition);
		model.addAttribute("adminLevel", adminLevel);
		model.addAttribute("depName", depName);
		model.addAttribute("depNo", depNo);
		System.out.println("email model :::: " + empName +","+ email +","+ empRank +","+ adminLevel +","+ empPosition +","+ depName + "," + depNo);
		return "member/join";
	}
	
	@PostMapping("join")
	public String join(MemberDto dto) throws Exception {
		
		System.out.println(dto);
		
		int result = service.join(dto);
		
		if(result > 0) {
			return "redirect:/member/login";
		}
		return "member/join";
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
