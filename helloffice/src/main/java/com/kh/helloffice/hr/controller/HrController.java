package com.kh.helloffice.hr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.helloffice.hr.service.HrService;
import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.workflow.entity.TagDto;

@Controller
@RequestMapping("hr")
public class HrController {
	
	@Autowired
	public HrService service;
	
	@GetMapping("teamList")
	public String teamList(Model model) throws Exception {
		
		List<MemberDto> teamList = service.getTeamList();
		model.addAttribute("teamList", teamList);
		
		return "hr/teamList";
	}
	
//	@GetMapping("teamList")
//	public String teamRepList(Model model) throws Exception {
//		
//		List<MemberDto> repTeamList = service.getRepTeamList();
//		model.addAttribute("repTeamList", repTeamList);
//		
//		return "hr/teamList";
//	}
//	
//	@GetMapping("teamList")
//	public String markTeamList(Model model) throws Exception {
//		
//		List<MemberDto> markTeamList = service.getMarkTeamList();
//		model.addAttribute("markTeamList", markTeamList);
//		
//		return "hr/teamList";
//	}
//	
//	@GetMapping("teamList")
//	public String salesTeamList(Model model) throws Exception {
//		
//		List<MemberDto> salesTeamList = service.getSalesTeamList();
//		model.addAttribute("salesTeamList", salesTeamList);
//		
//		return "hr/teamList";
//	}
//	
//	@GetMapping("teamList")
//	public String designTeamList(Model model) throws Exception {
//		
//		List<MemberDto> designTeamList = service.getDesignTeamList();
//		model.addAttribute("designTeamList", designTeamList);
//		
//		return "hr/teamList";
//	}
//	
	
	
	
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
