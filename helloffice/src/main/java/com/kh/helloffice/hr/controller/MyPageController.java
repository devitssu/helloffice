package com.kh.helloffice.hr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.hr.service.HrMyPageService;
import com.kh.helloffice.member.entity.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("hr")
@Slf4j
public class MyPageController {
	
	@Autowired
	private HrMyPageService service;
	
	@GetMapping("myPage")
	public String mypage(HttpServletRequest req, HttpSession session) {
		//로그인 한 경우에만 보여주기
		MemberDto loginEmp = (MemberDto) session.getAttribute("loginEmp");
		System.out.println(loginEmp);
		if(loginEmp == null) {
			req.setAttribute("msg", "로그인  하고 오세요 ~~~ ");
			return "error/errorPage";
		}
		return "hr/myPage";
	}
	
	@GetMapping("editInsaPage")
	public String editInsaPage(HttpServletRequest req, HttpSession session, Model model) throws Exception {
		MemberDto loginEmp = (MemberDto) session.getAttribute("loginEmp");
		List<DeptDto> deptList = service.getDeptList();
		model.addAttribute("deptList", deptList);
		if(loginEmp == null) {
			req.setAttribute("msg", "로그인  하고 오세요 ~~~ ");
			return "error/errorPage";
		}
		return "hr/editInsaPage";
	}
	
	//인사정보 수정 로직 처리
	@PostMapping("editInsaPage")
	public String editInsaPage(MemberDto dto, HttpSession session) throws Exception {
		MemberDto insaPage = service.editInsaPage(dto);
		System.out.println(insaPage);
		if(insaPage != null) {
			// ㅇㅋ
			session.setAttribute("loginEmp", insaPage);
			return "redirect:/hr/editInsaPage";
		}else {
			// 업데이트 ㄴㄴ
			return "redirect:/hr/editInsaPagee?";
		}
	}
	
	@GetMapping("editBasicPage")
	public String editBasicPage(HttpServletRequest req, HttpSession session) {
		MemberDto loginEmp = (MemberDto) session.getAttribute("loginEmp");
		if(loginEmp == null) {
			req.setAttribute("msg", "로그인  하고 오세요 ~~~ ");
			return "error/errorPage";
		}
		return "hr/editBasicPage";
	}
	
	//기본정보 수정 로직 처리
	@PostMapping("editBasicPage")
	public String editBasicPage(MemberDto dto, HttpSession session) throws Exception {
		MemberDto basicPage = service.editBasicPage(dto);
		System.out.println("basicPage edited:::::" + basicPage);
		if(basicPage != null) {
			session.setAttribute("loginEmp", basicPage);
			return "redirect:/hr/editBasicPage";
		}else {
			return "redirect:/hr/editBasicPagee?";
		}
	}

}
