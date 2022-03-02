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

@Controller
@RequestMapping("hr")
public class HrController {
	
	@Autowired
	public HrService service;
	
	
//	@GetMapping("teamList")
//	public String teamList() {
//		return "hr/teamList";
//	}
	
	@GetMapping("teamList")
	public String teamList(MemberDto dto, Model model) throws Exception {
		
		List<MemberDto> teamList = service.getTeamList(dto);
		model.addAttribute("teamList", teamList);
		
		System.out.println(teamList);
		
		if(teamList ==null) {
			return "redirect:/hr/teamLdist";
		}else {
			return "redirect:/hr/teamList";
		}
		
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
