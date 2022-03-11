package com.kh.helloffice.work.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.helloffice.work.entity.OffDto;
import com.kh.helloffice.work.service.OffService;

@Controller
@RequestMapping
public class OffController {

	@Autowired
	OffService offService;
	
	
	@GetMapping("off")
	public ModelAndView offlist() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/off");
		return mav;
	}
	
	//휴가 생성 게시글 목록
	@GetMapping("adminOff")
	public ModelAndView adminOffList() throws Exception {
		List<OffDto> list = offService.adminListAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/adminOff");
		mav.addObject("list",list);
		return mav;
	}
	
	//게시글 작성 화면
	@GetMapping("write")
	public String offCreate() {
		return "work/write";
	}
	
	//게시글 작성 처리
	@PostMapping("insert.do")
	public String insert(@ModelAttribute OffDto dto) throws Exception{
		offService.create(dto);
		return "redirect:adminOff";
	}
	
	//게시글 상세내용 조회
	@GetMapping("view.do")
	public ModelAndView offView(@RequestParam int offNo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/view");
		mav.addObject("dto", offService.read(offNo));
		return mav;
	}
	
	//게시글 수정
	@PostMapping("update.do")
	public String update(@ModelAttribute OffDto dto) throws Exception{
		offService.update(dto);
		return "redirect:adminOff";
	}
	
	//게시글 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int offNo) throws Exception{
		offService.delete(offNo);
		return "redirect:adminOff";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("useDoOff")
	public String useDoOff() {
		
		return "work/useDoOff";
	}
	
	@GetMapping("offPayBack")
	public String offPayBack() {
		
		return "work/offPayBack";
	}
}
