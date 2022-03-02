package com.kh.helloffice.work.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.helloffice.work.entity.WorkDto;

@Controller
public class WorkMainController {

	@Autowired
	private SqlSession ss;
	
	//출퇴근 조회
	@GetMapping("workMain")
	public String workMain(Model model) {
		//db가서 쿼리 날려서 가져온다
		List<WorkDto> list = ss.selectList("work.selectAll"); //(쿼리, data)
		//결과를 화면에 전달
		model.addAttribute("list",list);
		return "work/workMain";
	}
	
	
}
