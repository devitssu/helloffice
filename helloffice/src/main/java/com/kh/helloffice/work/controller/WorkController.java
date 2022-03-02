package com.kh.helloffice.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.helloffice.work.entity.WorkDto;
import com.kh.helloffice.work.service.WorkService;

@Controller
public class WorkController {

	@Autowired
	private WorkService service;
	
	@GetMapping("/work.do")
	public String insert() {
		System.out.println();
		return "workMain";
	}
	
	@PostMapping("/work.do")
	public String insert(WorkDto dto, BindingResult error) {

		//로직 처리-> 서비스한테 맡김);
		int result = service.enrollWork(dto);
		
		//화면 선택
		if (result > 0 ) {
			//success
			return "redirect:/workMain ";
		} else {
			//fail
			return "redirect:/error/exception";
		}
		
	}
	
	
	
	
	
	
}
