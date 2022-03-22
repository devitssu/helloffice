package com.kh.helloffice.hr.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.helloffice.hr.entity.AcademicDto;
import com.kh.helloffice.hr.entity.CareerDto;
import com.kh.helloffice.hr.entity.DeptDto;
import com.kh.helloffice.hr.service.HrMyPageService;
import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.work.entity.OffDto;
import com.kh.helloffice.work.entity.UrgeDto;
import com.kh.helloffice.work.service.OffService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("hr")
@Slf4j
public class MyPageController {
	
	@Autowired
	private HrMyPageService service;
	
	@GetMapping("myPage")
	public String mypage(HttpSession session, Model model) throws Exception {
		//로그인 한 경우에만 보여주기
		MemberDto loginEmp = (MemberDto) session.getAttribute("loginEmp");
		System.out.println("loginEmp" + loginEmp);
		
		if(loginEmp != null) {
			long empNo = loginEmp.getEmpNo();
			System.out.println("로그인 한 사람의 empNo =:::" + empNo);
			
			CareerDto myCareer = service.getMyCareer(empNo);
			model.addAttribute("myCareer", myCareer);
			System.out.println(myCareer);
			
			AcademicDto myAca = service.getMyAca(empNo);
			model.addAttribute("myAca", myAca);
			System.out.println(myAca);
			
			return "hr/myPage";
		}else {
			return "error/errorPage";
		}
	}
	
	
	// 나의 인사정보 수정 페이지
	@GetMapping("myPage/editInsaPageM")
	public String getInsaPage(HttpSession session, Model model) throws Exception{
		MemberDto loginEmp = (MemberDto) session.getAttribute("loginEmp");
		List<DeptDto> deptList = service.getDeptList();
		model.addAttribute("deptList", deptList);
		if(loginEmp == null) {
			return "error/errorPage";
		}
		return "hr/editInsaPageM";
	}
	
	// 나의 인사정보 수정 로직 처리
	@PostMapping("myPage/editInsaPageM")
	public String editInsaPage(MemberDto dto, HttpSession session) throws Exception {
		MemberDto updatedMember = service.editInsaPage(dto);
		if(updatedMember != null) {
			session.setAttribute("loginEmp", updatedMember);
			return "redirect:/hr/myPage";
		}else {
			return "redirect:/hr/myPage/editInsaPageM";
		}
	}
	
	// 나의 기본정보 수정 페이지 
	@GetMapping("myPage/editBasicPageM")
	public String getBasicPage(HttpSession session, Model model) throws Exception{
		MemberDto loginEmp = (MemberDto) session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "error/errorPage";
		}
		return "hr/editBasicPageM";
	}
	
	// 나의 기본정보 수정 로직 처리
	@PostMapping("myPage/editBasicPageM")
	public String editBasicPage(MemberDto dto, HttpSession session) throws Exception {
		MemberDto basicPage = service.editBasicPage(dto);
		if(basicPage != null) {
			session.setAttribute("loginEmp", basicPage);
			return "redirect:/hr/myPage";
		}else {
			return "redirect:/hr/myPage/editBasicPageM";
		}
	}
	
	// 멤버 인사정보 수정 페이지
	@GetMapping("teamList/memberPage/editInsaPage/{empNo}")
	public String getInsaPage(HttpSession session, Model model, @PathVariable int empNo) throws Exception {
		MemberDto loginEmp = (MemberDto) session.getAttribute("loginEmp");
		
		List<DeptDto> deptList = service.getDeptList();
		model.addAttribute("deptList", deptList); // 부서 수정 시 필요.
		
		List<MemberDto> insaPageInfo = service.getInsaPageInfo(empNo);
		model.addAttribute("insaPageInfo", insaPageInfo); // 사원번호로 정보 불러오기
		System.out.println(insaPageInfo);
		
		return "hr/editInsaPage";
	}
	
	// 멤버 인사정보 수정 로직 처리
	@PostMapping("/teamList/memberPage/editInsaPage/{empNo}")
	public String editInsaPage(MemberDto dto, Model model, @PathVariable int empNo) throws Exception {
		MemberDto updatedMember = service.editInsaPage(dto);
		System.out.println(updatedMember);
		if(updatedMember != null) {
			model.addAttribute("insaPageInfo", updatedMember);
			return "redirect:/hr/teamList/memberPage/{empNo}";
		}else {
			return "redirect:{empNo}";
		}
	}
	
	// 멤버 기본정보 수정 페이지 
	@GetMapping("teamList/memberPage/editBasicPage/{empNo}")
	public String getBasicPage(HttpSession session, Model model, @PathVariable int empNo) throws Exception {

		List<MemberDto> basicPageInfo = service.getBasicPageInfo(empNo);
		model.addAttribute("basicPageInfo", basicPageInfo);
		System.out.println(basicPageInfo);
		
		return "hr/editBasicPage";
	}
	
	// 멤버 기본정보 수정 로직 처리
	@PostMapping("/teamList/memberPage/editBasicPage/{empNo}")
	public String editBasicPage(MemberDto dto, Model model, @PathVariable int empNo) throws Exception {
		MemberDto basicPage = service.editBasicPage(dto);
		System.out.println("basicPage edited:::::" + basicPage);
		if(basicPage != null) {
			model.addAttribute("basicPageInfo", basicPage);
			return "redirect:/hr/teamList/memberPage/{empNo}";
		}else {
			return "redirect:{empNo}";
		}
	}
	
	// 나의 경력 만들기	페이지 
	@GetMapping("myPage/createCareerPage")
	public String createCareerPage() throws Exception{
		return "hr/createCareerPage";
	}

	// 나의 경력 만들기 로직 
	@PostMapping("myPage/createCareerPage")
	public String createCareerPage(CareerDto dto) throws Exception{
		int result = service.createMyCareer(dto);
		if(result > 0) {
			return "redirect:/hr/myPage";
		}
		return "redirect:/hr/myPage/editCareerPage";
	}
	
	// 나의 경력 페이지 (data O)
	@GetMapping("myPage/editCareerPage/{empNo}")
	public String getCareerPage(Model model, @PathVariable int empNo) throws Exception{
		CareerDto careerInfo = service.getMyCareer(empNo);
		System.out.println("careerInfo:::" + careerInfo);
		model.addAttribute("careerInfo", careerInfo);
		return "hr/editCareerPage";
	}
	
	// 나의 경력 페이지 수정 로직 처리
	@PostMapping("myPage/editCareerPage/{empNo}")
	public String getCareerPage(Model model,@PathVariable int empNo, CareerDto dto) throws Exception {		
		System.out.println("careerUdt empNo:::" +empNo);
		int careerUdt = service.careerUdt(dto);
		if(careerUdt > 0) {
			return "redirect:/hr/myPage";
		}else {
			return "redirect:/hr/myPage/editCareerPage/{empNo}";
		}
	}
	
	// 나의 학력 만들기	페이지 
	@GetMapping("myPage/createAcaPage")
	public String createAcaPage() throws Exception{
		return "hr/createAcaPage";
	}

	// 나의 학력 만들기 로직 
	@PostMapping("myPage/createAcaPage")
	public String createAcaPage(AcademicDto dto) throws Exception{
		int result = service.createMyAca(dto);
		if(result > 0) {
			return "redirect:/hr/myPage";
		}
		return "redirect:/hr/myPage/createAcaPage";
	}
	
	// 나의 학력 페이지 (data O)
	@GetMapping("myPage/editAcaPage/{empNo}")
	public String getAcaPage(Model model, @PathVariable int empNo) throws Exception{
		AcademicDto acaInfo = service.getMyAca(empNo);
		System.out.println("acaInfo:::" + acaInfo);
		model.addAttribute("acaInfo", acaInfo);
		return "hr/editAcaPage";
	}
	
	// 나의 학력 페이지 수정 로직 처리
	@PostMapping("myPage/editAcaPage/{empNo}")
	public String getAcaPage(Model model, @PathVariable int empNo, AcademicDto dto) throws Exception {		
		System.out.println("academicUdt empNo:::" +empNo);
		int academicUdt = service.academicUdt(dto);
		if(academicUdt > 0) {
			return "redirect:/hr/myPage";
		}else {
			return "redirect:/hr/myPage/editAcaPage/{empNo}";
		}
	}
}
