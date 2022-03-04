package com.kh.helloffice.work.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
			return "redirect:/error/exception";
		}
	}
	
	//출퇴근 세션에 저장
	@GetMapping("/work.do")
	public String workEmp(HttpSession session, WorkDto dto) throws Exception{
		return "redirect:/";
	}
	
	
	//출퇴근 조회
	@GetMapping("/workMain")
	public String workMain(Model model) throws Exception {
		//db가서 쿼리 날려서 가져온다
//		List<WorkDto> list = ss.selectList("work.selectAll"); //(쿼리, data)
		
		List<WorkDto> list = service.selectList();
		
		//결과를 화면에 전달
		model.addAttribute("list", list);

		System.out.println("selectList :" + list);
		return "work/workMain";
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
	public String out(WorkDto dto) throws Exception {
		int result = service.workOut(dto);
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
}
