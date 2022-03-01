package com.kh.helloffice.workflow.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.helloffice.workflow.entity.TagDto;
import com.kh.helloffice.workflow.service.WorkflowService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public String getTagList(Model model) throws Exception{
		List<TagDto> tagList = service.selectTagList();
		model.addAttribute("tagList", tagList);
		log.info(tagList.toString());
		for(TagDto t : tagList) {
			System.out.println(t);	
		}
		return "workflow/wfForm";
	}
	  
	//태그 작성
	@PostMapping("/wfForm/addTag")
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
	@PostMapping("/wfForm/deleteTag")
	@ResponseBody
	public String deleteTag(HttpServletRequest req) throws Exception {
		//ajax로부터 받은 데이터 처리하기
		String targetName = req.getParameter("targetName");
		System.out.println("받은 태그이름 데이터 :: "+targetName);
		int result = service.deleteTag(targetName);
		if(result>0) {
			return "delete success :: ";
		}else {
			return "error";
		}
	}
	
	//태그 수정
	//@RequestParam("targetName") String targetName, @RequestParam("toChange") String toChange
	@PostMapping("/wfForm/updateTag")
	@ResponseBody
	public String updateTag(@RequestBody TagDto tagDto) throws Exception{
		//ajax로부터 받은 데이터 처리하기
		System.out.println("받은 태그이름 데이터 :: "+tagDto.getTagName());
		System.out.println("수정할 태그이름 :: "+tagDto.getToChange());
		
		log.info(tagDto.toString());
		int result = service.updateTag(tagDto);
		System.out.println(result);
		if(result>0) {
			return "update success :: ";
		}else {
			return "error";
		}
		
	}
	
	 
	
}
