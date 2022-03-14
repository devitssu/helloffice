package com.kh.helloffice.work.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.helloffice.work.entity.OffDto;
import com.kh.helloffice.work.entity.UrgeDto;
import com.kh.helloffice.work.entity.WorkPageVo;
import com.kh.helloffice.work.service.UrgeCalService;

@Controller
public class UrgeCalController {

	@Autowired
	private UrgeCalService service;
	
	//촉구서 리스트
	@RequestMapping("useDoOff")
	public ModelAndView urgeList(@RequestParam(defaultValue="all") String searchOption,
								 @RequestParam(defaultValue="") String keyword,
								 @RequestParam(defaultValue = "1") int curPage) throws Exception{
		
		//레코드의 갯수
		int count = service.countArticle(searchOption, keyword);
		
		//페이징 관련
		WorkPageVo pageVo = new WorkPageVo(count, curPage);
		int start = pageVo.getPageBegin();
		int end = pageVo.getPageEnd();
				
		List<UrgeDto> list = service.urgeListAll(start, end, searchOption, keyword);
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("pageVo", pageVo);
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("map", map);
		mav.setViewName("work/useDoOff");
		return mav;
	}
	
	
	//촉구서 작성
	@PostMapping("urgeInsert.do")
	public String urgeInsert(@ModelAttribute UrgeDto dto) throws Exception {
		service.urgeInsert(dto);
		return "redirect:useDoOff";
	}
	
	
	//촉구서 상세내용
	@GetMapping("urgeView.do")
	public ModelAndView urgeView(@RequestParam int urgeNo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/urgeView");
		mav.addObject("dto", service.urgeRead(urgeNo));
		return mav;
	}
	
	
	//촉구서 수정
	@PostMapping("urgeUpdate.do")
	public String urgeUpdate(@ModelAttribute UrgeDto dto) throws Exception{
		service.urgeUpdate(dto);
		return "redirect:useDoOff";
	}
	
	
	//촉구서 삭제
	@RequestMapping("urgeDelete.do")
	public String urgeDelete(@RequestParam int urgeNo) throws Exception{
		service.urgeDelete(urgeNo);
		return "redirect:useDoOff";
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("offPayBack")
	public String offPayBack() {
		
		return "work/offPayBack";
	}
	
}
