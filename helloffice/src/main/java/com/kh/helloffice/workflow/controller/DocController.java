package com.kh.helloffice.workflow.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.workflow.entity.WfDocDto;
import com.kh.helloffice.workflow.entity.WfFormDto;
import com.kh.helloffice.workflow.service.DocService;
import com.kh.helloffice.workflow.service.WorkflowService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("workflow")
public class DocController {
	
	@Autowired
	private DocService service;
	
	@Autowired
	private WorkflowService wfService;

	//내문서함
	@GetMapping("/myWf")
	public String myDoc(@SessionAttribute("loginEmp") MemberDto loginEmp,  Model model) throws Exception {
		//받은 문서함
		List<WfDocDto> mySendList = service.mySendList(loginEmp.getEmpNo());
		System.out.println(mySendList);
		model.addAttribute("mySendList", mySendList);
		
		//보낸 문서함
		List<WfDocDto> myGetList = service.myGetList(loginEmp.getEmpNo());
		System.out.println(myGetList);
		model.addAttribute("myGetList", myGetList);
		return "workflow/myDoc";
	}	
	
	//모든 문서함: 문서 보여주기 && 양식 리스트보여주기
	@GetMapping("/allWf")
	public String getAllDoc(Model model) throws Exception {
		List<WfDocDto> docList = service.selectDocList();
		System.out.println("=-=-===controller-=-=-=");
		model.addAttribute("docList", docList);
		System.out.println(docList);
		List<WfFormDto> wfFormList = wfService.selectWfFormList();
		model.addAttribute("wfFormList", wfFormList);
		System.out.println(wfFormList);
		return "workflow/allDoc";
	}
	
	//중요표시 변경
	@GetMapping("/allWf/changeImpor")
	@ResponseBody
		public String changeImpor(@RequestParam("docTNo") long docTNo) throws Exception{
		System.out.println(docTNo);
		int resultChange = service.changeImpor(docTNo);
		System.out.println(resultChange);
		if(resultChange>0) {
			return "::from con 성공";
		}else {
			return "::from con 변경 실패";
		}
	}
	
	//중요표시 변경
	@GetMapping("/myWf/changeImpor")
	@ResponseBody
	public String changeMyImpor(@RequestParam("docTNo") long docTNo) throws Exception{
		System.out.println(docTNo);
		int resultChange = service.changeImpor(docTNo);
		System.out.println(resultChange);
		if(resultChange>0) {
			return "::from con 성공";
		}else {
			return "::from con 변경 실패";
		}
	}
	
	//모든 문서 - 문서 상세조회
	@GetMapping("/allWf/getEachDoc")
	@ResponseBody
	public List<WfDocDto> getEachDoc(Model model, long docTNo) throws Exception{
		List<WfDocDto> wfEachDoc = service.selectEachDoc(docTNo);
		System.out.println(wfEachDoc);
		model.addAttribute("wfEachDoc", wfEachDoc);
		return wfEachDoc;
	}
	
	//모든 문서 - 각 문서의 승인단계 조회
	@GetMapping("/allWf/getDocStep")
	@ResponseBody
	public List<WfDocDto> getDocStep(Model model, long docTNo) throws Exception{
		List<WfDocDto> docEachStep = service.selectDocApp(docTNo);
		System.out.println(docEachStep);
		model.addAttribute("docEachStep", docEachStep);
		return docEachStep;
	}
	
	//내문서 - 문서 상세조회
	@GetMapping("/myWf/getEachDoc")
	@ResponseBody
	public List<WfDocDto> getEachDoc2(Model model, long docTNo) throws Exception{
		List<WfDocDto> wfEachDoc2 = service.selectEachDoc(docTNo);
		System.out.println(wfEachDoc2);
		model.addAttribute("wfEachDoc2", wfEachDoc2);
		return wfEachDoc2;
	}
	
	//내문서 - 각 문서의 승인단계 조회
	@GetMapping("/myWf/getDocStep")
	@ResponseBody
	public List<WfDocDto> getDocStep2(Model model, long docTNo) throws Exception{
		List<WfDocDto> docEachStep2 = service.selectDocApp(docTNo);
		System.out.println(docEachStep2);
		model.addAttribute("docEachStep2", docEachStep2);
		return docEachStep2;
	}
	
	//승인하기
	@PostMapping("/myWf/approve")
	@ResponseBody
	public String docApprove(@RequestBody WfDocDto wfDocDto) throws Exception{
		int result = service.docApprove(wfDocDto);
		if(result>0) {
			return "success";
		}else {
			return "fail";			
		}
	}
	
	//거절하기
	@PostMapping("/myWf/decline")
	@ResponseBody
	public String docDecline(@RequestBody WfDocDto wfDocDto) throws Exception{
		int result = service.docDecline(wfDocDto);
		if(result>0) {
			return "success";
		}else {
			return "fail";			
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
