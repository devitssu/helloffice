package com.kh.helloffice.work.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.helloffice.work.entity.WorkEditDto;
import com.kh.helloffice.work.service.WorkEditService;

@Controller
public class WorkEditController {
	
	@Autowired
	private WorkEditService service;
	
	@Autowired
	private SqlSession ss;

	@PostMapping("/editInsert.do")
	public String editInsert(@ModelAttribute WorkEditDto dto) {
		
		service.enrollEdit(dto);
		
		return "redirect:workMain";
	}
	
	
}
	

