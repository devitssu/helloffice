package com.kh.helloffice.hr.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.helloffice.hr.entity.AcademicDto;
import com.kh.helloffice.hr.entity.AllDto;
import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.hr.entity.InsaNoteDto;
import com.kh.helloffice.hr.service.HrService;
import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.work.entity.OffDto;
import com.kh.helloffice.work.entity.UrgeDto;
import com.kh.helloffice.work.service.OffService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("hr")
public class HrController {
	
	@Autowired
	OffService offService;
	
	@Autowired
	private SqlSession ss;
	
	
	@Autowired
	public HrService service;
	
//	-- 팀 리스트 가져오기, 전체 사원 리스트 가져오기
	@GetMapping("teamList")
	public String getDeptList(Model model, HttpSession session) throws Exception {
		MemberDto loginEmp = (MemberDto) session.getAttribute("loginEmp");
		
		if(loginEmp != null) {
			String depName = loginEmp.getDepName();
			System.out.println("로그인 한 사람의 depName =:::" + depName);
			
			
			List<DeptDto> deptList = service.getDeptList();
			model.addAttribute("deptList", deptList);
			
			List<MemberDto> myTeamList = service.getMyTeamList(depName);
			model.addAttribute("myTeamList", myTeamList);
			
		}else {
			List<DeptDto> deptList = service.getDeptList();
			model.addAttribute("deptList", deptList);
			
			List<MemberDto> myTeamList = service.getTeamList();
			model.addAttribute("myTeamList", myTeamList);
		}
		
		return "hr/teamList";
	}
	
//  -- 부서이름으로 멤버리스트 가져오기 
	@GetMapping("teamList/getMemberByDept")
	@ResponseBody
	public List<MemberDto> getMemberByDept(Model model, String deptName) throws Exception{
		List<DeptDto> deptList = service.getDeptList();
		model.addAttribute("deptList", deptList);
		List<MemberDto> memberListByDept;
		if(deptName.equals("전체")) {
			memberListByDept = service.getTeamList();
		}else {
			memberListByDept = service.getMemberListByDept(deptName);
		}
		model.addAttribute("memberListByDept", memberListByDept);
		return memberListByDept;
	}
	
//	-- 팀 리스트 중복체크
	@PostMapping("/teamList/deptDupCheck")
	@ResponseBody
	public int deptDupCheck(@RequestParam("depName") String depName) throws Exception {
		log.info("deptDupCheck_depName = "+ depName);
		int result = service.cntDepName(depName);
		return result;
	}
	
//	-- 팀 리스트 추가
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
//	-- 팀 리스트 수정
	@PostMapping("/teamList/updDeptName")
	@ResponseBody
	public String updDeptName(DeptDto deptDto) throws Exception { 
		
		int result = deptDupCheck(deptDto.getDepChange());
		System.out.println("success??????????" + result);

		log.info("deptDto::::" + deptDto.toString());
		
		if(result > 0) {
			return "deptDupCheck error";
		}else {
			int success = service.updDeptName(deptDto); 
			System.out.println("success??????????" + success);
			if(success > 0) { 
				return "updDeptName success";
			} else {
				return "updDeptName error"; 
			}			
		}
	}
//	-- 팀리스트 삭제 
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
	
	
	// 멤버 상세페이지 접속하기 
	@GetMapping("/teamList/memberPage/{empNo}")
	public String MemberInfo(Model model, @PathVariable int empNo) throws Exception {
		System.out.println("empNo::::"+empNo);
		AllDto memberInfo = service.getMemberInfo(empNo);
		System.out.println(memberInfo);
		model.addAttribute("memberInfo", memberInfo);
		
		List<InsaNoteDto> insanote = service.getInsanote(empNo);
		System.out.println("insanote::::" + insanote);
		model.addAttribute("insanote", insanote);
		
		return "/hr/memberPage";
	}
	
	
	// 인사노트 만들기 로직 
	@PostMapping("/teamList/memberPage/{empNo}")
	public String addInsaNote(InsaNoteDto dto) throws Exception{
		int result = service.addInsaNote(dto);
		if(result > 0) {
			return "redirect:/hr/teamList/memberPage/{empNo}";
		}
		return "redirect:/hr/teamList/memberPage/{empNo}";
	}
	
	// 인사노트 삭제 
	@DeleteMapping(value="/teamList/memberPage/{delNo}")
	@ResponseBody
	public String insaDel(@PathVariable int delNo) throws Exception {
		System.out.println("delNo ::: " + delNo);
		int result = service.insaDel(delNo);
		if(result>0) {
			return "success!!!!";
		}else {
			return "Fail";
		}
	}
	
	
	// 팀 리스트 검색기능 
	@GetMapping("hr/teamList")
	@ResponseBody
	public List<MemberDto> getSearchList(@RequestParam("keyword") String keyword, Model model) throws Exception {
		System.out.println("keyword:::" + keyword);
		MemberDto memberDto = new MemberDto();
		memberDto.setKeyword(keyword);
		
		List<MemberDto> searchList = service.getSearchList(memberDto);
		model.addAttribute("searchList", searchList);
		return searchList;
	}
	
	
	@GetMapping("teamReport")
	public String teamListForRreport(Model model, HttpSession session) throws Exception {
		MemberDto loginEmp = (MemberDto) session.getAttribute("loginEmp");
		
		if(loginEmp != null) {
			String depName = loginEmp.getDepName();
			System.out.println("로그인 한 사람의 depName =:::" + depName);
			
			List<MemberDto> teamList = service.getMyTeamList(depName);
			model.addAttribute("teamList", teamList);
			
		}else {
			List<MemberDto> teamList = service.getTeamList();
			model.addAttribute("teamList", teamList);
		}
		return "hr/teamReport";
	}
	
}
