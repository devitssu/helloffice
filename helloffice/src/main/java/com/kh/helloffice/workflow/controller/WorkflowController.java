package com.kh.helloffice.workflow.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.helloffice.workflow.entity.TagDto;
import com.kh.helloffice.workflow.service.WorkflowService;

@Controller
@RequestMapping("workflow")
public class WorkflowController {
	
	@Autowired
	private WorkflowService service;

	//내문서함
	@GetMapping("")
	public String myDoc() {
		return "workflow/myDoc";
	}
	
	//모든 문서함
	@GetMapping("/allWf")
	public String allDoc() {
		return "workflow/allDoc";
	}
	
	//양식
//	@GetMapping("/wfForm")
//	public String wfForm() {
//		return "workflow/wfForm";
//	}
	
	
	//태그 리스트 보여주기
	@GetMapping("/wfForm")
	public String tagList(Model model) throws Exception{
		List<TagDto> tagList = service.selectTagList();
		model.addAttribute("tagList", tagList);
		
		return "workflow/wfForm";
	}
	  
	//태그 작성
	@PostMapping("/wfForm")
	@ResponseBody
	public String addTag(TagDto tagDto, HttpServletRequest req, HttpServletResponse resp) throws Exception { 
	  
		//ajax로부터 받은 데이터 처리하기 
		String tagName = req.getParameter("tagName");
//		System.out.println("받은 태그이름 데이터 :: "+tagName);
		tagDto.setTagName(tagName);
//		System.out.println(tagDto);
		
		int result = service.insertTag(tagDto); 
		if(result>0) { 
			return "success :: "+tagDto;
		} else {
			return "error"; 
		}
	}
	
	//태그 삭제
//	@PostMapping(value = "/wfForm")
//	@ResponseBody
//	public String deleteTag() throws Exception {
//		
//	}
	
	 
	
}
