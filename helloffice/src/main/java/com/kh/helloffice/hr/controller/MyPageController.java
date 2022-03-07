package com.kh.helloffice.hr.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.helloffice.member.entity.MemberDto;

@Controller
@RequestMapping("hr")
public class MyPageController {
	
	@GetMapping("myPage")
	public String mypage(HttpServletRequest req, HttpSession session) {
		//로그인 한 경우에만 보여주기
		MemberDto loginUser = (MemberDto) session.getAttribute("loginEmp");
		System.out.println(loginUser);
		if(loginUser == null) {
			req.setAttribute("msg", "로그인  하고 오세요 ~~~ ");
			return "error/errorPage";
		}
		return "hr/myPage";
	}

}
