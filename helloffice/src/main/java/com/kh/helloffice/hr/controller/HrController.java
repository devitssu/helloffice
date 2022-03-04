package com.kh.helloffice.hr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.hr.service.HrService;
import com.kh.helloffice.member.entity.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("hr")
public class HrController {
	
	@Autowired
	public HrService service;
	
	@GetMapping("myPage")
	public String myPage() {
		
		return "hr/myPage";
	}
	
//	@GetMapping("teamList")
//	public String teamList(Model model) throws Exception {
//		
//		List<MemberDto> teamList = service.getTeamList();
//		model.addAttribute("teamList", teamList);
//		
//		return "hr/teamList";
//	}
//	
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
	
//	@GetMapping("teamList")
//	public String getDeptList(Model model, DeptDto deptDto) throws Exception {
//		List<DeptDto> deptList = service.getDeptList(deptDto);
//		model.addAttribute("deptList", deptList);
//		
//		System.out.println(deptList);
//		return "hr/teamList";
//	}
	
	@GetMapping("teamList")
	public String getDeptList(Model model) throws Exception {
		
		List<DeptDto> deptList = service.getDeptList();
		model.addAttribute("deptList", deptList);
		return "hr/teamList";
	}
	
	@PostMapping("/teamList/deptDupCheck")
	@ResponseBody
	public int deptDupCheck(@RequestParam("depName") String depName) throws Exception {
		log.info("deptDupCheck_depName = "+ depName);
		int result = service.cntDepName(depName);
		return result;
	}
	
	@PostMapping("/teamList/deptAdd")
	@ResponseBody
	public String deptAdd(DeptDto deptDto, @RequestParam("depName") String depName) throws Exception { 
		int result = deptDupCheck(depName);
		if(result > 0) {
			return "deptDupCheck error";
		}else {
			int success = service.insertDept(deptDto); 
			if(success > 0) { 
				return "insertDept success : " + depName;
			} else {
				return "insertDept error"; 
			}			
		}
	}
	
	@PostMapping("/teamList/updDeptName")
	@ResponseBody
	public String updDeptName(DeptDto deptDto, @RequestParam("depName") String depName, @RequestParam("updDept") String updDept) throws Exception { 
		log.info("updDeptName_depName = "+ depName);
		log.info("updDeptName_updDept = "+ updDept);
		
		int result = deptDupCheck(depName);
		System.out.println("success??????????" + result);

		if(result > 0) {
			return "deptDupCheck error";
		}else {
			int success = service.updDeptName(deptDto); 
			if(success > 0) { 
				return "updDeptName success";
			} else {
				return "updDeptName error"; 
			}			
		}
	}
	
	@PostMapping("/teamList/delDeptName")
	@ResponseBody
	public String delDeptName(@RequestParam("depName") String depName) throws Exception {
		int result = service.delDeptName(depName);
		// System.out.println("delDeptName::" + result);
		
		if(result>0) {
			return "delDeptName success";
		}else {
			return "delDeptName error";
		}
	}
	
	
	@GetMapping("mypage")
	public String mypage(HttpServletRequest req, HttpSession session) {
		//로그인 한 경우에만 보여주기
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		System.out.println(loginUser);
		if(loginUser == null) {
			req.setAttribute("msg", "로그인  하고 오세요 ~~~ ");
			return "error/errorPage";
		}
		return "hr/myPage";
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
