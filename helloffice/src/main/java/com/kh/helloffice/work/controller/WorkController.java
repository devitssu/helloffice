package com.kh.helloffice.work.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.work.entity.WorkDto;
import com.kh.helloffice.work.entity.WorkPageVo;
import com.kh.helloffice.work.service.WorkService;

@Controller
public class WorkController {

	@Autowired
	private WorkService service;
	
	@Autowired
	private SqlSession ss;
	
	//출퇴근 insert
	@PostMapping("/work.do")
	public String insert(HttpSession session,HttpServletRequest request,WorkDto dto, BindingResult error) throws Exception {
		
		//세션 가져오기
		session = request.getSession();
		MemberDto loginEmp = (MemberDto)session.getAttribute("loginEmp");
		int empNo = (int) loginEmp.getEmpNo();
		
		dto.setEmpNo(empNo);
		System.out.println("empno : " + empNo);
		
		//로직 처리-> 서비스한테 맡김);
		int result = service.enrollWork(dto);
		
		System.out.println("int insert : " + result);
		
		WorkDto workEmp = service.workIn(dto);
		
		System.out.println("workEmp : " + workEmp);
		//화면 경로 선택
		if (result > 0 && workEmp != null) {
//			succes
			session.setAttribute("workEmp", workEmp);
			return "redirect:/";
		} else {
			//fail
			return "redirect:/";
		}
	}
	
	//관리자용 출퇴근 조회 수정 삭제
	@GetMapping( value = {"/adminWorkMain", "/adminWorkMain/{page}"})
	public String workMain( Model model,@PathVariable(required = false) String page, HttpServletRequest request) throws Exception {
		
		if(page == null) page = "1";
		
		//페이지 vo타입 객체 생성
		int cntPerPage = 10; //한 페이지당 *개씩 보여주기
		int pageBtnCnt = 5; //한번에 보여줄 페이지 버튼 갯수
		int totalRow = service.getWorkCnt(); //DB에 있는 모든 row 갯수
		WorkPageVo pageVo = new WorkPageVo(page, cntPerPage, pageBtnCnt, totalRow);
		
		//리스트 조회
		List<WorkDto> list = service.selectList(pageVo);
		
		Enumeration<String> attributes = request.getSession().getAttributeNames();
		while (attributes.hasMoreElements()) {
		    String attribute = (String) attributes.nextElement();
		    System.err.println(attribute+" : "+request.getSession().getAttribute(attribute));
		}
		
		//결과를 화면에 전달
		model.addAttribute("list", list);
		model.addAttribute("page", pageVo);
		System.out.println("selectList :" + list);
		
		return "/work/adminWorkMain";
	}
	
	//출퇴근 상세 조회
	@GetMapping("/workMain/detail/{i}")
	public String workdetail(@PathVariable String i, Model model) { //화면에서 String 타입의 inDate 를 받아서 그 로우를 조회
		
		WorkDto dto = ss.selectOne("work.selectOneByInDate", i); //일단 검색해서, 그결과를 dto에 넣은 후,
		System.out.println("selectOne :" + dto);
		
		model.addAttribute("data", dto); //화면에 전달.
		return "work/workDetail";
	}
	
	
	//출퇴근 수정
	@PostMapping("/edit")
	public String edit(WorkDto dto) {
		//dto 가지고 처리
		int result = service.edit(dto);
		
		System.out.println("출퇴근 수정 : " + result);
		
		if (result > 0) {
			//success
			return "redirect:/workMain";
		} else {
			return "redirect:/error/exception";
		}
		
	}
	
	//출퇴근 삭제
	@PostMapping("/delete")
	public String delete(WorkDto dto) {
		int result = service.delete(dto);
		
		System.out.println("삭제하기 : " + result);
		if (result > 0) {
			//success
			return "redirect:/workMain";
		} else {
			return "redirect:/error/exception";
		}
	}
	
	
	//퇴근 도장 꽝!
	@PostMapping("/out.do")
	public String out(HttpSession session,WorkDto dto) throws Exception {
		int result = service.workOut(dto);
		System.out.println("outtime : "+result);
		
//		WorkDto workOutEmp = service.workOut(dto);
		session.setAttribute("outTime2", result);
		
		return "redirect:/";
	}
	
	//주단위 사원만 조회
	@GetMapping("/workMain")
	public String weekListView(Model model) throws Exception {
		List<WorkDto> weekList = service.selectWeekList();
	
		model.addAttribute("weekList", weekList);
		return "work/workMain";
	}
	
	
	//일년 단위로 조회 --검색 기능 추가
	@GetMapping("/workYear")
	public String workYear(Model model) {
		List<WorkDto> yearList = service.selectYearList();
		
		model.addAttribute("yearList", yearList);
		return "work/workYear";
	}
	
	
	//월 단위 조회 -- 검색 기능 추가
	@GetMapping("/workMonth")
	public String workMonth(Model model) {
		
		List<WorkDto> monthList = service.selectMonthList();
		
		model.addAttribute("monthList", monthList);
		
		return "work/workMonth";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}