package com.kh.helloffice.email.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.helloffice.email.entity.EmailDto;
import com.kh.helloffice.email.service.EmailService;
import com.kh.helloffice.hr.entity.DeptDto;

@Controller
public class EmailController {
 
    @Autowired
    private EmailService service;
    
  //mailSend 코드
  	@GetMapping("/mail/send")
  	public String showSendPage(Model model) throws Exception {
  		List<DeptDto> deptList = service.getDeptList();
		model.addAttribute("deptList", deptList);
  		return "mail/send";
  	}
  	
  	@RequestMapping("/mail/doSend")
  	public String doSend(String title, String body, String empName, String email, String empRank, int adminLevel, String empPosition, String depName, int depNo) {
//  		body += empPosition;
//  		body += "@@@"+empRank;
  		Map<String, Object> sendRs = service.send(title, body, empName, email, empRank, adminLevel, empPosition, depName, depNo);
  		
  		return "redirect:/hr/teamList";
  	}
  	
}
